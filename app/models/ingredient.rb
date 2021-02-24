class Ingredient < ApplicationRecord

    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients

    def self.list_alphabetically
        self.all.sort{|a,b| a.name <=> b.name}
    end


end
