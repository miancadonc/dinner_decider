class RecipesController < ApplicationController

    def show
        @user = User.find(params[:user_id])
        @recipe = Recipe.find(params[:id])
    end

    def new
        @user = User.find(params[:user_id])
        @recipe = @user.recipes.build
        15.times { @recipe.recipe_ingredients.build }
    end

    def create
        @user = User.find(params[:user_id])
        recipe = @user.recipes.build(recipe_params)

        if recipe.save
            redirect_to user_path(@user)
        else
            render 'new'
        end

    end

    def index
        @user = User.find(params[:user_id])
    end

    def edit
        @user = User.find(params[:user_id])
        @recipe = Recipe.find(params[:id])
        @recipe_ingredients = @recipe.recipe_ingredients
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :description, :instructions, recipe_ingredients_attributes: [:ingredient_id, :magnitude, :unit] )
    end

end