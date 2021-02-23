class Recipe < ApplicationRecord

    has_many :recipe_tags
    has_many :tags, through: :recipe_tags

    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    belongs_to :user

    accepts_nested_attributes_for :recipe_ingredients
end
