class IngredientsController < ApplicationController

    def show
        @user = User.find(params[:user_id])
        @ingredient = Ingredient.find(params[:id])
    end

    # this controller method and its partner in the tag controller smell like code. 
    # Maybe introducing before actions to the controllers (all of them, even) for params searchable objects is needed.

end
