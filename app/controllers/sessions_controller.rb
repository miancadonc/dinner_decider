class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def new
  end

  def create

    if auth_hash

      sign_in_with_auth(auth_hash)
      

    else

      sign_in_with_password

    end

    # both sign_in methods defined in application_controller.rb

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
