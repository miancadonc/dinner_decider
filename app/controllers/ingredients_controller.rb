class IngredientsController < ApplicationController

    before_action :find_user, only: :show
    before_action :find_ingredient, only: [:show, :destroy, :edit, :update]

    def show
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
        if !params[:category].blank?
            @ingredients = Ingredient.by_category(params[:category]).list_alphabetically
        else
            @ingredients = Ingredient.all.list_alphabetically.select{|ing| ing.name != ""}
        end
    end

    # the index action's select could maybe be combined with the recipe_ingredients helper no_blank_ingredients

    def destroy
        @ingredient.destroy
        flash[:notice] = "Ingredient deleted"
        redirect_to ingredients_path
    end

    def edit
    end

    def update

        if @ingredient.update(ingredient_params)
            flash[:notice] = "Successfully updated ingredient!"
            redirect_to ingredients_path
        else
            flash[:alert] = "Sorry, something went wrong"
            render 'edit'
        end
    end

    private

    def ingredient_params
        params.require(:ingredient).permit(:name, :category)
    end

    def find_ingredient
        @ingredient = Ingredient.find(params[:id])
    end

end
