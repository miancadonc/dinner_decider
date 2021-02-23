class RecipesController < ApplicationController

    def show
        @recipe = Recipe.find(params[:id])
    end

    def new
        @user = User.find(params[:user_id])
        @recipe = @user.recipes.build
        15.times { @recipe.recipe_ingredients.build }
    end

end
