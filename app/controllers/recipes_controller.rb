class RecipesController < ApplicationController

    def show
        @recipe = Recipe.find_by(id: params[:id])
    end

end
