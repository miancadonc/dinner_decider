class UsersController < ApplicationController
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

  def show
    @user = User.find(session[:user_id])
  end

  def random_recipes
    @user = User.find(params[:user_id])
  end

  def browse_by_tag
    @user = User.find(params[:user_id])
  end

  def browse_by_ingredient
    @user = User.find(params[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end

end
