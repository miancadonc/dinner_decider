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
            flash[:notice] = "Successfully created recipe!"
            redirect_to user_path(@user)
        else
            flash[:alert] = "Sorry, something went wrong"
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

    def update
        @user = User.find(params[:user_id])
        @recipe = Recipe.find(params[:id])

        if @recipe.update(recipe_params)
            flash[:notice] = "Successfully updated recipe!"
            redirect_to user_recipe_path(@user, @recipe)
        else
            flash[:alert] = "Sorry, something went wrong"
            render 'edit'
        end

    end

    def destroy
        @user = User.find(params[:user_id])
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        flash[:notice] = "Recipe deleted"
        redirect_to user_path(@user)
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :description, :instructions, recipe_ingredients_attributes: [:ingredient_id, :magnitude, :unit, :id] )
    end

end