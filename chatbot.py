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
MODEL          = os.getenv("OLLAMA_MODEL",   "qwen2.5:7b")

SCHEMA = """
Node labels and key properties:
  Restaurant  { name }
  Category    { name }
  MenuItem    { name, price (float, optional), isVegan (bool, optional), description (string, optional) }
  Protein     { name, isVegan (bool, optional) }
  Cheese      { name, upcharge (float) }
  Topping     { name }
  Bread       { name }

Relationships:
  (Restaurant)-[:HAS_CATEGORY]->(Category)
  (Category)-[:HAS_ITEM]->(MenuItem)
  (MenuItem)-[:MADE_WITH]->(Protein)
  (MenuItem)-[:INCLUDES]->(Cheese|Topping|Bread)
  (Category)-[:OFFERS_CHEESE {upcharge: float}]->(Cheese)
  (Category)-[:OFFERS_FREE]->(Topping)
  (Category)-[:OFFERS_ADDON {upcharge: 1.50}]->(Topping|Cheese)

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
- Use case-insensitive matching where helpful: toLower(m.name) CONTAINS toLower('keyword')
- If the question truly cannot be answered from this graph, return exactly:
    RETURN "Not available" AS answer
"""

ANSWER_PROMPT = """You are a friendly, helpful chatbot for Bob's Steaks and Hoagies.
Given the customer's question and the data retrieved from the menu, give a natural,
conversational answer. Be concise. Never mention databases, Cypher, or graphs.
If the data is empty, say the item isn't on the menu."""


def generate_cypher(question: str, history: list[dict]) -> str:
    messages = [{"role": "system", "content": CYPHER_PROMPT}]
    messages += history[-6:]
    messages.append({"role": "user", "content": question})
    resp = ollama.chat(model=MODEL, messages=messages)
    cypher = resp["message"]["content"].strip()
    return cypher.replace("```cypher", "").replace("```", "").strip()


def run_query(driver, cypher: str) -> list[dict]:
    with driver.session() as session:
        return [dict(r) for r in session.run(cypher)]


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
            cypher = generate_cypher(question, history)
            if debug:
                print(f"[Cypher] {cypher}\n")

            data = run_query(driver, cypher)
            answer = generate_answer(question, data, history)

            history.append({"role": "user",      "content": question})
            history.append({"role": "assistant",  "content": answer})

        except Exception as e:
            print(f"Bob's: Sorry, I had trouble with that. ({e})\n")

    driver.close()


if __name__ == "__main__":
    main()
