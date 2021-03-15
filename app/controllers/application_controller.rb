class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user

    private

    def sign_in_with_auth(auth_hash)

        #use uid to find; assign provider & password
        @user = User.find_by(uid: auth_hash[:uid])

        if @user
            session[:user_id] = @user.id
        else
            @user = User.create_from_omniauth(auth_hash)
        end
        redirect_to user_path(@user)
    end

    def sign_in_with_password

        @user = User.find_by(email: params[:email])

        #normal bcrypt authentication, plus verify that oauth provider isn't present
        if @user.try(:authenticate, params[:password]) && @user.provider == nil
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to login_path, alert: "Unable to log in, please check email and password"
        end

    end

    def admin
        logged_in? && current_user.admin == true
    end


    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def find_user
        @user = User.find(params[:user_id])
    end

    def find_recipe

        if params[:recipe_id]
            @recipe = Recipe.find(params[:recipe_id])
        else
            @recipe = Recipe.find(params[:id])
        end
        
    end


end
