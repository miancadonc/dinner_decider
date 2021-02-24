# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

recipes = Recipe.create([{name: "Udon", user_id: 5}, {name: "Grilled Cheese", user_id: 5}, {name: "Gumbo", user_id: 5}])
ingredients = Ingredient.create(
    [{name: "onion"}, {name: "carrot"}, {name: "ginger"}, {name: "potato"}, {name: "soy sauce"}, {name: "egg"}, {name: "milk"}, {name: "sriracha" }, {name: "mustard" },
        {name: "yellow onion" }, {name: "red onion" }, {name: "shallot" }, {name: "green bell pepper" }, {name: "red bell pepper" }, {name: "flour" }, {name: "yeast" },
        {name: "salt" }, {name: "sugar" }, {name: "turbinado sugar" }, {name: "water" }, {name: "vinegar" }, {name: "balsamic vinegar" }, {name: "bay leaf" },
        {name: "cayenne" }, {name: "curry powder" }, {name: "curry paste" }, {name: "jalapeno pepper" }, {name: "cilantro" }, {name: "cumin" }, {name: "paprika" },
        {name: "bread crumbs" }, {name: "lemon zest" }, {name: "lemon juice" }, {name: "orange zest" }, {name: "orange juice" }, {name: "chocolate chip" }, {name: "olive oil" },
        {name: "butter" }, {name: "unsalted butter" }, {name: "spinach" }, {name: "peanut butter" }, {name: "american cheese" }, {name: "cheese" }, {name: "cheddar" },
        {name: "parmesan" }, {name: "asiago" }, {name: "bacon" }, {name: "ground beef" }, {name: "chicken thigh" }, {name: "rosemary" }, {name: "mushroom" },]
)