class IngredientsController < ApplicationController

    before_action :find_user, only: :show
    before_action :find_ingredient, only: [:show, :destroy, :edit, :update]

    def show
    end

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
            @ingredients = Ingredient.no_blanks.list_alphabetically
        end
    end

    # Ingredient no_blanks scope removes the blank ingredient; this isn't necessary for the by_category scope because the blank ingredient's category is nil

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
