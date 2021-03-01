module TagsHelper

    def user_recipes(user, tag)
        tag.recipes.select{|r| r.user == user }
    end

end
