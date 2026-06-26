import os
import ollama
from neo4j import GraphDatabase

try:
    from dotenv import load_dotenv
    load_dotenv()
except ImportError:
    pass

NEO4J_URI      = os.getenv("NEO4J_URI",      "bolt://localhost:7687")
NEO4J_USER     = os.getenv("NEO4J_USER",     "neo4j")
NEO4J_PASSWORD = os.getenv("NEO4J_PASSWORD", "")
MODEL          = os.getenv("OLLAMA_MODEL",   "tomasonjo/llama3-text2cypher-demo")

SCHEMA = """
Node labels and key properties:
  Restaurant  { name }
  Category    { name }
  MenuItem    { name, price (float, optional), isVegan (bool, optional), description (string, optional) }
  Protein     { name, isVegan (bool, optional) }
  Cheese      { name, upcharge (float) }
  Topping     { name }
  Bread       { name }

Relationships (written as Cypher patterns with variables):
  (r:Restaurant)-[:HAS_CATEGORY]->(c:Category)
  (c:Category)-[:HAS_ITEM]->(m:MenuItem)
  (m:MenuItem)-[:MADE_WITH]->(p:Protein)
  (m:MenuItem)-[:INCLUDES]->(ch:Cheese)
  (m:MenuItem)-[:INCLUDES]->(t:Topping)
  (m:MenuItem)-[:INCLUDES]->(b:Bread)
  (c:Category)-[:OFFERS_CHEESE {upcharge: float}]->(ch:Cheese)
  (c:Category)-[:OFFERS_FREE]->(t:Topping)
  (c:Category)-[:OFFERS_ADDON {upcharge: 1.50}]->(t:Topping)

Category names (exact strings):
  "Fresh Cut Rib-Eye Steaks", "Chicken Steaks", "Fresh Cut Hoagies",
  "Specialty Hoagies", "Fresh Cut Vegan Hoagies", "100% Homemade Burgers",
  "French Fries", "Dessert", "Beverages"
"""

CYPHER_PROMPT = f"""You are a Cypher query generator for a Neo4j graph of a restaurant menu.

{SCHEMA}

Rules:
- Respond with ONLY a valid Cypher query. No explanation, no markdown, no code fences.
- Always alias return values with AS (e.g. m.name AS name, m.price AS price).
- Use toLower() only inside WHERE conditions for matching, never on return values.
- Always include WHERE m.price IS NOT NULL whenever m.price appears anywhere in the query.
- Use the simplest MATCH possible — only traverse a relationship if you need data from the related node. To get all menu items use MATCH (m:MenuItem) with no relationship.
- If the question truly cannot be answered from this graph, return exactly:
    RETURN "Not available" AS answer
"""

ANSWER_PROMPT = """You are a friendly, helpful chatbot for Bob's Steaks and Hoagies.
Given the customer's question and the data retrieved from the menu, give a natural,
conversational answer. Be concise. Never mention databases, Cypher, or graphs.
If the data is empty, say the item isn't on the menu."""


def clean_cypher(raw: str) -> str:
    return raw.strip().replace("```cypher", "").replace("```", "").strip()


def generate_and_run(question: str, history: list[dict], driver, max_retries: int = 3) -> tuple[str, list[dict]]:
    messages = [{"role": "system", "content": CYPHER_PROMPT}]
    messages += history[-6:]
    messages.append({"role": "user", "content": question})

    last_error = None
    for attempt in range(max_retries):
        resp = ollama.chat(model=MODEL, messages=messages)
        cypher = clean_cypher(resp["message"]["content"])

        try:
            with driver.session() as session:
                data = [dict(r) for r in session.run(cypher)]
            return cypher, data
        except Exception as e:
            last_error = e
            messages.append({"role": "assistant", "content": cypher})
            messages.append({
                "role": "user",
                "content": f"That query failed with this error:\n{e}\n\nReturn only the corrected Cypher query."
            })

    raise last_error


def generate_answer(question: str, data: list[dict], history: list[dict]) -> str:
    context = f"Customer question: {question}\n\nMenu data: {data}"
    messages = [{"role": "system", "content": ANSWER_PROMPT}]
    messages += history[-6:]
    messages.append({"role": "user", "content": context})

    print("Bob's: ", end="", flush=True)
    answer_parts = []
    for chunk in ollama.chat(model=MODEL, messages=messages, stream=True):
        token = chunk["message"]["content"]
        print(token, end="", flush=True)
        answer_parts.append(token)
    print("\n")
    return "".join(answer_parts)


def main():
    driver = GraphDatabase.driver(NEO4J_URI, auth=(NEO4J_USER, NEO4J_PASSWORD))

    print("=" * 50)
    print("  Bob's Steaks and Hoagies — Menu Chatbot")
    print("  Type 'quit' to exit | 'debug' to toggle Cypher")
    print("=" * 50 + "\n")

    history: list[dict] = []
    debug = False

    while True:
        try:
            question = input("You: ").strip()
        except (EOFError, KeyboardInterrupt):
            print("\nGoodbye!")
            break

        if not question:
            continue
        if question.lower() in ("quit", "exit", "q"):
            print("Goodbye!")
            break
        if question.lower() == "debug":
            debug = not debug
            print(f"[Debug mode {'ON' if debug else 'OFF'}]\n")
            continue

        try:
            cypher, data = generate_and_run(question, history, driver)
            if debug:
                print(f"[Cypher] {cypher}\n")

            answer = generate_answer(question, data, history)

            history.append({"role": "user",      "content": question})
            history.append({"role": "assistant",  "content": answer})

        except Exception as e:
            print(f"Bob's: Sorry, I had trouble with that. ({e})\n")

    driver.close()


if __name__ == "__main__":
    main()
