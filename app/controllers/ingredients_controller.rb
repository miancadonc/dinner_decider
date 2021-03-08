class IngredientsController < ApplicationController

    def show
        @user = User.find(params[:user_id])
        @ingredient = Ingredient.find(params[:id])
    end

    # this controller method and its partner in the tag controller smell like code. 
    # Maybe introducing before actions to the controllers (all of them, even) for params searchable objects is needed.

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(ingredient_params)

        if @ingredient.save
            flash[:notice] = "Ingredient successfully created"
            redirect_to new_ingredient_path
        else
            @ingredient.name = nil
            flash[:alert] = "Something went wrong, Ingredient not saved"
            render 'new'
        end
    end

    def index
        @ingredients = Ingredient.all
    end

    def destroy
        @ingredient = Ingredient.find(params[:id])
        @ingredient.destroy
        flash[:notice] = "Ingredient deleted"
        redirect_to ingredients_path
    end

    private

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end

end
