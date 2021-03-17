class Ingredient < ApplicationRecord

    has_many :recipe_ingredients, :dependent => :destroy
    has_many :recipes, through: :recipe_ingredients

    validates :name, uniqueness: { message: "Ingredient already exists" }

    scope :by_category, -> (category) { where('category == ?', category) }
    scope :no_blanks, -> { where.not('name == ""') }


    CATEGORIES = [
        "",
        "dairy",
        "seasoning",
        "red meat",
        "vegetable",
        "oil",
        "sauce",
        "allium",
        "baking",
        "fowl",
        "fish",
        "noodles",
        "other"
    ]

    

    


end
