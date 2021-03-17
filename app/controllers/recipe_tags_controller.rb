class RecipeTagsController < ApplicationController

  before_action :find_user
  before_action :find_recipe

  def new
    @recipe_tag = @recipe.recipe_tags.build
  end

  def create
    @recipe_tag = @recipe.recipe_tags.build(recipe_tag_params)

    if @recipe_tag.save
      flash[:notice] = "Tag successfully created"
      render 'new'
    else
      flash[:alert] = "Unable to create tag"
      render 'new'
    end
  end

  def destroy
    recipe_tag = RecipeTag.find(params[:id])
    recipe_tag.destroy
    redirect_to user_recipe_path(@user, @recipe)
  end

  private

  def recipe_tag_params
    params.require(:recipe_tag).permit(:tag_id, :recipe_id)
  end

end
