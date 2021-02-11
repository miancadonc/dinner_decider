class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def new
  end

  def create

    

   

    # elsif auth_hash

    #   pp auth_hash

    

    #   redirect_to root_path

    # end

    

    # params[:password] = 

    if auth_hash

      sign_in_with_auth(auth_hash)

    else

      sign_in_with_password

    end

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
