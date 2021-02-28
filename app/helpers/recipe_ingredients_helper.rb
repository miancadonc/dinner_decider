module RecipeIngredientsHelper

    def no_blank_ingredients(recipe)
        recipe.recipe_ingredients.select{|r_i| r_i.ingredient.name != ""}
    end

end
