class RecipeTagsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_tag = @recipe.recipe_tags.build
  end

  def create
    @user = User.find(params[:user_id])
    @recipe = Recipe.find(params[:recipe_id])
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
    @user = User.find(params[:user_id])
    @recipe = Recipe.find(params[:recipe_id])
    recipe_tag = RecipeTag.find(params[:id])
    recipe_tag.destroy
    redirect_to user_recipe_path(@user, @recipe)
  end

  private

  def recipe_tag_params
    params.require(:recipe_tag).permit(:tag_id, :recipe_id)
  end

end
