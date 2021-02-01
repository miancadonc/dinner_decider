class SessionsController < ApplicationController
  def new
  end

  def create

    @user = User.find_by(name: params[:name])
    return head(:forbidden) unless @user.try(:authenticate, params[:password])
    session[:user_id] = @user.id
    redirect_to user_path(@user)

  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
