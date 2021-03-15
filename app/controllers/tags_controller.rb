class TagsController < ApplicationController


    before_action :find_user, only: :show

    def show
        @tag = Tag.find(params[:id])
    end

    def new
        @tag = Tag.new
    end

    def create
        @tag = Tag.new(tag_params)

        if @tag.save
            flash[:notice] = "Tag successfully created"
            redirect_to new_tag_path
        else
            @tag.name = nil
            flash[:alert] = "Something went wrong, tag not saved"
            render 'new'
        end
    end

    def index
        @tags = Tag.all.list_alphabetically
    end

    def destroy
        @tag = Tag.find(params[:id])
        @tag.destroy
        flash[:notice] = "Tag deleted"
        redirect_to tags_path
    end

    private

    def tag_params
        params.require(:tag).permit(:name)
    end

end
 