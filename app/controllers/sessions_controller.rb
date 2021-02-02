class SessionsController < ApplicationController
  def new
  end

  def create

    @user = User.find_by(name: params[:name])
    if @user.try(:authenticate, params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to login_path, alert: "Unable to log in, please check username and password"
    end

  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
