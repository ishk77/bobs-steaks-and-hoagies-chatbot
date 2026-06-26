// ============================================================
// BOB'S STEAKS AND HOAGIES — KNOWLEDGE GRAPH
// ============================================================

CREATE

// --- Restaurant ---
(r:Restaurant {name: "Bob's Steaks and Hoagies"}),

// --- Categories ---
(catRibeye:Category   {name: "Fresh Cut Rib-Eye Steaks"}),
(catChicken:Category  {name: "Chicken Steaks"}),
(catHoagies:Category  {name: "Fresh Cut Hoagies"}),
(catSpecialty:Category{name: "Specialty Hoagies"}),
(catVegan:Category    {name: "Fresh Cut Vegan Hoagies"}),
(catBurgers:Category  {name: "100% Homemade Burgers"}),
(catFries:Category    {name: "French Fries"}),
(catDessert:Category  {name: "Dessert"}),
(catBev:Category      {name: "Beverages"}),

// --- Proteins ---
(pRibeye:Protein          {name: "Rib-Eye Steak"}),
(pChicken:Protein         {name: "Chicken"}),
(pGroundBeef:Protein      {name: "Ground Beef"}),
(pRoastBeef:Protein       {name: "London Roast Beef"}),
(pCornBeef:Protein        {name: "Corn Beef"}),
(pCajunTurkey:Protein     {name: "Cajun Turkey"}),
(pTurkeyHam:Protein       {name: "Turkey Ham"}),
(pGourmetTurkey:Protein   {name: "Gourmet Turkey"}),
(pBuffaloChicken:Protein  {name: "Buffalo Chicken"}),
(pItalianTuna:Protein     {name: "Italian Tuna"}),
(pTuna:Protein            {name: "Tuna"}),
(pChickenSalad:Protein    {name: "Chicken Salad"}),
(pHoneyBBQ:Protein        {name: "Honey Barbecue Chicken Breast"}),
(pPastrami:Protein        {name: "Beef Pastrami"}),
(pMapleHoney:Protein      {name: "Maple Honey Turkey"}),
(pPepperTurkey:Protein    {name: "Pepper Turkey"}),
(pGenoaSalami:Protein     {name: "Genoa Salami"}),
(pCotegina:Protein        {name: "Cotegina"}),
(pHotCapicola:Protein     {name: "Hot Capicola"}),
(pImportedHam:Protein     {name: "Imported Ham"}),
(pVeganRoastedTurkey:Protein {name: "Vegan Roasted Turkey", isVegan: true}),
(pVeganPepperTurkey:Protein  {name: "Vegan Pepper Turkey",  isVegan: true}),
(pVeganSmokedTurkey:Protein  {name: "Vegan Smoked Turkey",  isVegan: true}),

// --- Cheeses ---
(chAmerican:Cheese       {name: "American Cheese",  upcharge: 0.00}),
(chSharpProvolone:Cheese {name: "Sharp Provolone",  upcharge: 1.00}),
(chExtraProvolone:Cheese {name: "Extra Provolone",  upcharge: 3.00}),
(chPepperJack:Cheese     {name: "Pepper Jack",       upcharge: 1.00}),
(chWhiz:Cheese           {name: "Cheese Whiz",       upcharge: 1.00}),
(chExtraWhiz:Cheese      {name: "Extra Cheese Whiz", upcharge: 3.00}),
(chAll3:Cheese           {name: "All 3 Cheeses",     upcharge: 4.00}),
(chMildProvolone:Cheese  {name: "Mild Provolone",    upcharge: 0.00}),
(chSwiss:Cheese          {name: "Swiss Cheese",      upcharge: 0.00}),

// --- Toppings ---
(tMushrooms:Topping     {name: "Mushrooms"}),
(tPeppers:Topping       {name: "Peppers"}),
(tBuffaloSauce:Topping  {name: "Buffalo Sauce"}),
(tMarinara:Topping      {name: "Marinara Sauce"}),
(tColeslaw:Topping      {name: "Coleslaw"}),
(tSpecialSauce:Topping  {name: "Special Sauce"}),
(tFriedOnion:Topping    {name: "Fried Onions"}),
(tRawOnion:Topping      {name: "Raw Onions"}),
(tCrushedHot:Topping    {name: "Crushed Hot Peppers"}),
(tKetchup:Topping       {name: "Ketchup"}),
(tMayo:Topping          {name: "Mayonnaise"}),
(tSweetPeppers:Topping  {name: "Sweet Peppers"}),
(tBananaPeppers:Topping {name: "Banana Peppers"}),
(tSaltPepper:Topping    {name: "Salt/Pepper"}),
(tMustard:Topping       {name: "Mustard"}),
(tLettuce:Topping       {name: "Lettuce"}),
(tTomatoes:Topping      {name: "Tomatoes"}),
(tOnions:Topping        {name: "Onions"}),
(tHotPeppers:Topping    {name: "Hot Peppers"}),
(tHotSeedsPickles:Topping {name: "Hot Seeds Pickles"}),
(tExtraVinegar:Topping  {name: "Extra Vinegar"}),
(tOil:Topping           {name: "Oil"}),
(tRedWineVinegar:Topping{name: "Red Wine Vinegar"}),
(tOregano:Topping       {name: "Oregano"}),
(tCheddar:Topping       {name: "Cheddar Cheese"}),
(tCooperSharp:Topping   {name: "Cooper Sharp"}),
(tFeta:Topping          {name: "Feta Cheese"}),

// --- Bread ---
(bHoagie:Bread {name: "Hoagie Roll"}),
(bRye:Bread    {name: "Rye Bread"}),

// ===========================================================
// MENU ITEMS
// ===========================================================

// --- Fresh Cut Rib-Eye Steaks ---
(m01:MenuItem {name: "Regular Steak",                            price: 14.00}),
(m02:MenuItem {name: "Cheese Steak",                             price: 15.00}),
(m03:MenuItem {name: "Pepper Steak",                             price: 15.00}),
(m04:MenuItem {name: "Pepper Cheese Steak",                      price: 16.00}),
(m05:MenuItem {name: "Mushroom Cheese Steak",                    price: 16.00}),
(m06:MenuItem {name: "Steak Hoagie",                             price: 15.00}),
(m07:MenuItem {name: "Cheese Steak Hoagie",                      price: 16.00}),
(m08:MenuItem {name: "Pizza Steak with Sauce & Sharp Provolone", price: 16.00}),

// --- Chicken Steaks ---
(m09:MenuItem {name: "Chicken Steak",                              price: 14.00}),
(m10:MenuItem {name: "Chicken Cheese Steak",                       price: 15.00}),
(m11:MenuItem {name: "Chicken Pepper Steak",                       price: 15.00}),
(m12:MenuItem {name: "Chicken Pepper Cheese Steak",                price: 16.00}),
(m13:MenuItem {name: "Mushroom Chicken Steak",                     price: 15.00}),
(m14:MenuItem {name: "Mushroom Chicken Cheese Steak",              price: 16.00}),
(m15:MenuItem {name: "Chicken Steak Hoagie",                       price: 15.00}),
(m16:MenuItem {name: "Chicken Cheese Steak Hoagie",                price: 16.00}),
(m17:MenuItem {name: "Chicken Pizza Steak with Sauce & Provolone", price: 16.00}),
(m18:MenuItem {name: "Buffalo Chicken Cheese Steak",               price: 16.00}),

// --- Fresh Cut Hoagies ---
(m19:MenuItem {name: "London Roast Beef and Cheese",   price: 12.90}),
(m20:MenuItem {name: "Corn Beef and Cheese",           price: 12.90}),
(m21:MenuItem {name: "Cajun Turkey and Cheese",        price: 11.00}),
(m22:MenuItem {name: "Turkey Ham",                     price: 10.15}),
(m23:MenuItem {name: "Gourmet Turkey",                 price: 10.15}),
(m24:MenuItem {name: "Buffalo Chicken",                price: 10.15}),
(m25:MenuItem {name: "Italian Tuna",                   price: 11.20}),
(m26:MenuItem {name: "Tuna",                           price: 11.20}),
(m27:MenuItem {name: "Chicken Salad",                  price: 11.20}),
(m28:MenuItem {name: "Honey Barbecue Chicken Breast",  price: 13.50}),
(m29:MenuItem {name: "Cheese Hoagie",                  price:  9.20}),
(m30:MenuItem {name: "Beef Pastrami",                  price: 13.90}),
(m31:MenuItem {name: "Maple Honey Turkey",             price: 13.90}),
(m32:MenuItem {name: "Pepper Turkey",                  price: 13.50}),

// --- Specialty Hoagies (price at counter) ---
(m33:MenuItem {name: "Corn Beef Panini",
               description: "Corn beef with coleslaw and special sauce on rye bread"}),
(m34:MenuItem {name: "Jews Deluxe",
               description: "Roast beef, corned beef, and gourmet turkey with swiss cheese"}),
(m35:MenuItem {name: "Italian",
               description: "Genoa Salami, Cotegina, Hot Capicola, Imported Ham and Mild Provolone"}),
(m36:MenuItem {name: "Ham and Cheese",
               description: "Imported Ham with cheese of your choice"}),

// --- Fresh Cut Vegan Hoagies ---
(m37:MenuItem {name: "Vegan Roasted Turkey", price: 15.90, isVegan: true}),
(m38:MenuItem {name: "Vegan Pepper Turkey",  price: 15.90, isVegan: true}),
(m39:MenuItem {name: "Vegan",                price: 14.90, isVegan: true}),
(m40:MenuItem {name: "Vegan Smoked Turkey",  price: 15.90, isVegan: true}),

// --- 100% Homemade Burgers ---
(m41:MenuItem {name: "Regular Burger",        price: 5.00}),
(m42:MenuItem {name: "Cheeseburger",          price: 6.00}),
(m43:MenuItem {name: "Mushroom Burger",       price: 6.00}),
(m44:MenuItem {name: "Mushroom Cheeseburger", price: 7.00}),
(m45:MenuItem {name: "Pizza Burger",          price: 6.00}),
(m46:MenuItem {name: "Pepper Burger",         price: 5.00}),
(m47:MenuItem {name: "Pepper Cheeseburger",   price: 6.00}),

// --- French Fries ---
(m48:MenuItem {name: "French Fries", price: 4.00}),
(m49:MenuItem {name: "Cheese Fries", price: 6.00}),

// --- Dessert ---
(m50:MenuItem {name: "Pound Cake",            price: 5.50}),
(m51:MenuItem {name: "Chocolate Cake",        price: 5.59}),
(m52:MenuItem {name: "Strawberry Cake",       price: 5.50}),
(m53:MenuItem {name: "Bob's Cheesecake Cups", price: 6.00}),
(m54:MenuItem {name: "Lemon Cake",            price: 5.50}),
(m55:MenuItem {name: "Banana Pudding",        price: 6.50}),

// --- Beverages ---
(m56:MenuItem {name: "Soda"}),
(m57:MenuItem {name: "Water"}),
(m58:MenuItem {name: "Homemade Ice Tea"}),

// ===========================================================
// RELATIONSHIPS
// ===========================================================

// Restaurant → Categories
(r)-[:HAS_CATEGORY]->(catRibeye),
(r)-[:HAS_CATEGORY]->(catChicken),
(r)-[:HAS_CATEGORY]->(catHoagies),
(r)-[:HAS_CATEGORY]->(catSpecialty),
(r)-[:HAS_CATEGORY]->(catVegan),
(r)-[:HAS_CATEGORY]->(catBurgers),
(r)-[:HAS_CATEGORY]->(catFries),
(r)-[:HAS_CATEGORY]->(catDessert),
(r)-[:HAS_CATEGORY]->(catBev),

// Category → Menu Items
(catRibeye)-[:HAS_ITEM]->(m01),
(catRibeye)-[:HAS_ITEM]->(m02),
(catRibeye)-[:HAS_ITEM]->(m03),
(catRibeye)-[:HAS_ITEM]->(m04),
(catRibeye)-[:HAS_ITEM]->(m05),
(catRibeye)-[:HAS_ITEM]->(m06),
(catRibeye)-[:HAS_ITEM]->(m07),
(catRibeye)-[:HAS_ITEM]->(m08),

(catChicken)-[:HAS_ITEM]->(m09),
(catChicken)-[:HAS_ITEM]->(m10),
(catChicken)-[:HAS_ITEM]->(m11),
(catChicken)-[:HAS_ITEM]->(m12),
(catChicken)-[:HAS_ITEM]->(m13),
(catChicken)-[:HAS_ITEM]->(m14),
(catChicken)-[:HAS_ITEM]->(m15),
(catChicken)-[:HAS_ITEM]->(m16),
(catChicken)-[:HAS_ITEM]->(m17),
(catChicken)-[:HAS_ITEM]->(m18),

(catHoagies)-[:HAS_ITEM]->(m19),
(catHoagies)-[:HAS_ITEM]->(m20),
(catHoagies)-[:HAS_ITEM]->(m21),
(catHoagies)-[:HAS_ITEM]->(m22),
(catHoagies)-[:HAS_ITEM]->(m23),
(catHoagies)-[:HAS_ITEM]->(m24),
(catHoagies)-[:HAS_ITEM]->(m25),
(catHoagies)-[:HAS_ITEM]->(m26),
(catHoagies)-[:HAS_ITEM]->(m27),
(catHoagies)-[:HAS_ITEM]->(m28),
(catHoagies)-[:HAS_ITEM]->(m29),
(catHoagies)-[:HAS_ITEM]->(m30),
(catHoagies)-[:HAS_ITEM]->(m31),
(catHoagies)-[:HAS_ITEM]->(m32),

(catSpecialty)-[:HAS_ITEM]->(m33),
(catSpecialty)-[:HAS_ITEM]->(m34),
(catSpecialty)-[:HAS_ITEM]->(m35),
(catSpecialty)-[:HAS_ITEM]->(m36),

(catVegan)-[:HAS_ITEM]->(m37),
(catVegan)-[:HAS_ITEM]->(m38),
(catVegan)-[:HAS_ITEM]->(m39),
(catVegan)-[:HAS_ITEM]->(m40),

(catBurgers)-[:HAS_ITEM]->(m41),
(catBurgers)-[:HAS_ITEM]->(m42),
(catBurgers)-[:HAS_ITEM]->(m43),
(catBurgers)-[:HAS_ITEM]->(m44),
(catBurgers)-[:HAS_ITEM]->(m45),
(catBurgers)-[:HAS_ITEM]->(m46),
(catBurgers)-[:HAS_ITEM]->(m47),

(catFries)-[:HAS_ITEM]->(m48),
(catFries)-[:HAS_ITEM]->(m49),

(catDessert)-[:HAS_ITEM]->(m50),
(catDessert)-[:HAS_ITEM]->(m51),
(catDessert)-[:HAS_ITEM]->(m52),
(catDessert)-[:HAS_ITEM]->(m53),
(catDessert)-[:HAS_ITEM]->(m54),
(catDessert)-[:HAS_ITEM]->(m55),

(catBev)-[:HAS_ITEM]->(m56),
(catBev)-[:HAS_ITEM]->(m57),
(catBev)-[:HAS_ITEM]->(m58),

// MenuItem → Protein (MADE_WITH)
(m01)-[:MADE_WITH]->(pRibeye),
(m02)-[:MADE_WITH]->(pRibeye),
(m03)-[:MADE_WITH]->(pRibeye),
(m04)-[:MADE_WITH]->(pRibeye),
(m05)-[:MADE_WITH]->(pRibeye),
(m06)-[:MADE_WITH]->(pRibeye),
(m07)-[:MADE_WITH]->(pRibeye),
(m08)-[:MADE_WITH]->(pRibeye),

(m09)-[:MADE_WITH]->(pChicken),
(m10)-[:MADE_WITH]->(pChicken),
(m11)-[:MADE_WITH]->(pChicken),
(m12)-[:MADE_WITH]->(pChicken),
(m13)-[:MADE_WITH]->(pChicken),
(m14)-[:MADE_WITH]->(pChicken),
(m15)-[:MADE_WITH]->(pChicken),
(m16)-[:MADE_WITH]->(pChicken),
(m17)-[:MADE_WITH]->(pChicken),
(m18)-[:MADE_WITH]->(pChicken),

(m19)-[:MADE_WITH]->(pRoastBeef),
(m20)-[:MADE_WITH]->(pCornBeef),
(m21)-[:MADE_WITH]->(pCajunTurkey),
(m22)-[:MADE_WITH]->(pTurkeyHam),
(m23)-[:MADE_WITH]->(pGourmetTurkey),
(m24)-[:MADE_WITH]->(pBuffaloChicken),
(m25)-[:MADE_WITH]->(pItalianTuna),
(m26)-[:MADE_WITH]->(pTuna),
(m27)-[:MADE_WITH]->(pChickenSalad),
(m28)-[:MADE_WITH]->(pHoneyBBQ),
(m30)-[:MADE_WITH]->(pPastrami),
(m31)-[:MADE_WITH]->(pMapleHoney),
(m32)-[:MADE_WITH]->(pPepperTurkey),

(m33)-[:MADE_WITH]->(pCornBeef),
(m34)-[:MADE_WITH]->(pRoastBeef),
(m34)-[:MADE_WITH]->(pCornBeef),
(m34)-[:MADE_WITH]->(pGourmetTurkey),
(m35)-[:MADE_WITH]->(pGenoaSalami),
(m35)-[:MADE_WITH]->(pCotegina),
(m35)-[:MADE_WITH]->(pHotCapicola),
(m35)-[:MADE_WITH]->(pImportedHam),
(m36)-[:MADE_WITH]->(pImportedHam),

(m37)-[:MADE_WITH]->(pVeganRoastedTurkey),
(m38)-[:MADE_WITH]->(pVeganPepperTurkey),
(m40)-[:MADE_WITH]->(pVeganSmokedTurkey),

(m41)-[:MADE_WITH]->(pGroundBeef),
(m42)-[:MADE_WITH]->(pGroundBeef),
(m43)-[:MADE_WITH]->(pGroundBeef),
(m44)-[:MADE_WITH]->(pGroundBeef),
(m45)-[:MADE_WITH]->(pGroundBeef),
(m46)-[:MADE_WITH]->(pGroundBeef),
(m47)-[:MADE_WITH]->(pGroundBeef),

// MenuItem → Cheese (INCLUDES = comes with as listed)
(m02)-[:INCLUDES]->(chAmerican),
(m04)-[:INCLUDES]->(chAmerican),
(m05)-[:INCLUDES]->(chAmerican),
(m07)-[:INCLUDES]->(chAmerican),
(m08)-[:INCLUDES]->(chSharpProvolone),

(m10)-[:INCLUDES]->(chAmerican),
(m12)-[:INCLUDES]->(chAmerican),
(m14)-[:INCLUDES]->(chAmerican),
(m16)-[:INCLUDES]->(chAmerican),
(m17)-[:INCLUDES]->(chMildProvolone),
(m18)-[:INCLUDES]->(chAmerican),

(m19)-[:INCLUDES]->(chAmerican),
(m20)-[:INCLUDES]->(chAmerican),
(m21)-[:INCLUDES]->(chAmerican),
(m29)-[:INCLUDES]->(chAmerican),

(m34)-[:INCLUDES]->(chSwiss),
(m35)-[:INCLUDES]->(chMildProvolone),

(m42)-[:INCLUDES]->(chAmerican),
(m44)-[:INCLUDES]->(chAmerican),
(m47)-[:INCLUDES]->(chAmerican),
(m49)-[:INCLUDES]->(chAmerican),

// MenuItem → Topping / Bread (INCLUDES = built into item)
(m03)-[:INCLUDES]->(tPeppers),
(m04)-[:INCLUDES]->(tPeppers),
(m05)-[:INCLUDES]->(tMushrooms),
(m06)-[:INCLUDES]->(bHoagie),
(m07)-[:INCLUDES]->(bHoagie),
(m08)-[:INCLUDES]->(tMarinara),

(m11)-[:INCLUDES]->(tPeppers),
(m12)-[:INCLUDES]->(tPeppers),
(m13)-[:INCLUDES]->(tMushrooms),
(m14)-[:INCLUDES]->(tMushrooms),
(m15)-[:INCLUDES]->(bHoagie),
(m16)-[:INCLUDES]->(bHoagie),
(m17)-[:INCLUDES]->(tMarinara),
(m18)-[:INCLUDES]->(tBuffaloSauce),

(m24)-[:INCLUDES]->(tBuffaloSauce),
(m32)-[:INCLUDES]->(tPeppers),

(m33)-[:INCLUDES]->(tColeslaw),
(m33)-[:INCLUDES]->(tSpecialSauce),
(m33)-[:INCLUDES]->(bRye),

(m38)-[:INCLUDES]->(tPeppers),

(m43)-[:INCLUDES]->(tMushrooms),
(m44)-[:INCLUDES]->(tMushrooms),
(m45)-[:INCLUDES]->(tMarinara),
(m46)-[:INCLUDES]->(tPeppers),
(m47)-[:INCLUDES]->(tPeppers),

// Category → Cheese options (OFFERS_CHEESE with upcharge on relationship)
(catRibeye)-[:OFFERS_CHEESE {upcharge: 0.00}]->(chAmerican),
(catRibeye)-[:OFFERS_CHEESE {upcharge: 1.00}]->(chSharpProvolone),
(catRibeye)-[:OFFERS_CHEESE {upcharge: 3.00}]->(chExtraProvolone),
(catRibeye)-[:OFFERS_CHEESE {upcharge: 1.00}]->(chPepperJack),
(catRibeye)-[:OFFERS_CHEESE {upcharge: 1.00}]->(chWhiz),
(catRibeye)-[:OFFERS_CHEESE {upcharge: 3.00}]->(chExtraWhiz),
(catRibeye)-[:OFFERS_CHEESE {upcharge: 4.00}]->(chAll3),

(catChicken)-[:OFFERS_CHEESE {upcharge: 0.00}]->(chAmerican),
(catChicken)-[:OFFERS_CHEESE {upcharge: 1.00}]->(chSharpProvolone),
(catChicken)-[:OFFERS_CHEESE {upcharge: 3.00}]->(chExtraProvolone),
(catChicken)-[:OFFERS_CHEESE {upcharge: 1.00}]->(chPepperJack),
(catChicken)-[:OFFERS_CHEESE {upcharge: 1.00}]->(chWhiz),
(catChicken)-[:OFFERS_CHEESE {upcharge: 3.00}]->(chExtraWhiz),
(catChicken)-[:OFFERS_CHEESE {upcharge: 4.00}]->(chAll3),

// Category → Free steak toppings (OFFERS_FREE)
(catRibeye)-[:OFFERS_FREE]->(tFriedOnion),
(catRibeye)-[:OFFERS_FREE]->(tRawOnion),
(catRibeye)-[:OFFERS_FREE]->(tMarinara),
(catRibeye)-[:OFFERS_FREE]->(tCrushedHot),
(catRibeye)-[:OFFERS_FREE]->(tKetchup),
(catRibeye)-[:OFFERS_FREE]->(tMayo),
(catRibeye)-[:OFFERS_FREE]->(tSweetPeppers),
(catRibeye)-[:OFFERS_FREE]->(tBananaPeppers),
(catRibeye)-[:OFFERS_FREE]->(tSaltPepper),
(catRibeye)-[:OFFERS_FREE]->(tMustard),

(catChicken)-[:OFFERS_FREE]->(tFriedOnion),
(catChicken)-[:OFFERS_FREE]->(tRawOnion),
(catChicken)-[:OFFERS_FREE]->(tMarinara),
(catChicken)-[:OFFERS_FREE]->(tCrushedHot),
(catChicken)-[:OFFERS_FREE]->(tKetchup),
(catChicken)-[:OFFERS_FREE]->(tMayo),
(catChicken)-[:OFFERS_FREE]->(tSweetPeppers),
(catChicken)-[:OFFERS_FREE]->(tBananaPeppers),
(catChicken)-[:OFFERS_FREE]->(tSaltPepper),
(catChicken)-[:OFFERS_FREE]->(tMustard),

// Category → $1.50 add-on toppings (OFFERS_ADDON)
(catHoagies)-[:OFFERS_ADDON {upcharge: 1.50}]->(chSharpProvolone),
(catHoagies)-[:OFFERS_ADDON {upcharge: 1.50}]->(chAmerican),
(catHoagies)-[:OFFERS_ADDON {upcharge: 1.50}]->(tCheddar),
(catHoagies)-[:OFFERS_ADDON {upcharge: 1.50}]->(chSwiss),
(catHoagies)-[:OFFERS_ADDON {upcharge: 1.50}]->(tCooperSharp),
(catHoagies)-[:OFFERS_ADDON {upcharge: 1.50}]->(tFeta),
(catHoagies)-[:OFFERS_ADDON {upcharge: 1.50}]->(tLettuce),
(catHoagies)-[:OFFERS_ADDON {upcharge: 1.50}]->(tTomatoes),
(catHoagies)-[:OFFERS_ADDON {upcharge: 1.50}]->(tOnions),
(catHoagies)-[:OFFERS_ADDON {upcharge: 1.50}]->(tBananaPeppers),
(catHoagies)-[:OFFERS_ADDON {upcharge: 1.50}]->(tSweetPeppers),
(catHoagies)-[:OFFERS_ADDON {upcharge: 1.50}]->(tHotPeppers),
(catHoagies)-[:OFFERS_ADDON {upcharge: 1.50}]->(tHotSeedsPickles),
(catHoagies)-[:OFFERS_ADDON {upcharge: 1.50}]->(tExtraVinegar),
(catHoagies)-[:OFFERS_ADDON {upcharge: 1.50}]->(tOil),
(catHoagies)-[:OFFERS_ADDON {upcharge: 1.50}]->(tRedWineVinegar),
(catHoagies)-[:OFFERS_ADDON {upcharge: 1.50}]->(tOregano),

(catVegan)-[:OFFERS_ADDON {upcharge: 1.50}]->(chSharpProvolone),
(catVegan)-[:OFFERS_ADDON {upcharge: 1.50}]->(chAmerican),
(catVegan)-[:OFFERS_ADDON {upcharge: 1.50}]->(tCheddar),
(catVegan)-[:OFFERS_ADDON {upcharge: 1.50}]->(chSwiss),
(catVegan)-[:OFFERS_ADDON {upcharge: 1.50}]->(tCooperSharp),
(catVegan)-[:OFFERS_ADDON {upcharge: 1.50}]->(tFeta),
(catVegan)-[:OFFERS_ADDON {upcharge: 1.50}]->(tLettuce),
(catVegan)-[:OFFERS_ADDON {upcharge: 1.50}]->(tTomatoes),
(catVegan)-[:OFFERS_ADDON {upcharge: 1.50}]->(tOnions),
(catVegan)-[:OFFERS_ADDON {upcharge: 1.50}]->(tBananaPeppers),
(catVegan)-[:OFFERS_ADDON {upcharge: 1.50}]->(tSweetPeppers),
(catVegan)-[:OFFERS_ADDON {upcharge: 1.50}]->(tHotPeppers),
(catVegan)-[:OFFERS_ADDON {upcharge: 1.50}]->(tHotSeedsPickles),
(catVegan)-[:OFFERS_ADDON {upcharge: 1.50}]->(tExtraVinegar),
(catVegan)-[:OFFERS_ADDON {upcharge: 1.50}]->(tOil),
(catVegan)-[:OFFERS_ADDON {upcharge: 1.50}]->(tRedWineVinegar),
(catVegan)-[:OFFERS_ADDON {upcharge: 1.50}]->(tOregano)

// ===========================================================
// EXAMPLE QUERIES
// ===========================================================
//
// All items containing mushrooms:
// MATCH (m:MenuItem)-[:INCLUDES]->(t:Topping {name: "Mushrooms"}) RETURN m.name, m.price
//
// Cheapest item per category:
// MATCH (c:Category)-[:HAS_ITEM]->(m:MenuItem) WHERE m.price IS NOT NULL
// RETURN c.name, min(m.price) AS cheapest
//
// Everything made with Rib-Eye:
// MATCH (m:MenuItem)-[:MADE_WITH]->(p:Protein {name: "Rib-Eye Steak"}) RETURN m.name, m.price
//
// All vegan options:
// MATCH (m:MenuItem {isVegan: true}) RETURN m.name, m.price
//
// Items that share the Mushrooms topping across categories:
// MATCH (c:Category)-[:HAS_ITEM]->(m:MenuItem)-[:INCLUDES]->(t:Topping {name: "Mushrooms"})
// RETURN c.name, collect(m.name) AS mushroom_items
