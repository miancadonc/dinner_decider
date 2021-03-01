class TagsController < ApplicationController

    def show
        @user = User.find(params[:user_id])
        @tag = Tag.find(params[:id])
    end

end
