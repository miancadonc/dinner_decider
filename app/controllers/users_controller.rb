class UsersController < ApplicationController

  before_action :find_user, only: [:show, :random_recipes, :browse_by_tag, :browse_by_ingredient]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      # overwrite name if name uniqueness validation triggered so that placeholder can show
      #uniqueness validation changed to email
      @user.email = nil
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  # previous 3 actions only kept in case I want to add full crud to users specifically at some later point

  def show
  end

  def random_recipes
  end

  def browse_by_tag
  end

  def browse_by_ingredient

    if !params[:category].blank?
      @ingredients = @user.ingredients.by_category(params[:category]).list_alphabetically
    else
      @ingredients = @user.ingredients.list_alphabetically.select{|ing| ing.name != "" }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end

end
