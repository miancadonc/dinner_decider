class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def new
  end

  def create

    if @user = User.find_by(email: params[:email])

      if @user.try(:authenticate, params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to login_path, alert: "Unable to log in, please check email and password"
      end

    elsif auth_hash

      pp auth_hash

      redirect_to root_path

    end

    # pp auth_hash

    # redirect_to root_path

  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

end
