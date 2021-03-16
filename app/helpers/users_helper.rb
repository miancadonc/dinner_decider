module UsersHelper

    def random_recipes(user, number)
        user.recipes.sample(number)
    end

    def user_ingredients(user)
        ingredients = user.ingredients.list_alphabetically.uniq.drop(1)
        
    end

    def user_tags(user)
        tags = user.tags.list_alphabetically.uniq
    end

    # user_tags and user_ingredients use the list_alphabetically method defined in application_record.rb
    # using drop(1) in user_ingredients removes the blank ingredient but still returns the array, unlike .shift

    def user_recipes(user, object)
        object.recipes.select{|r| r.user == user }
    end

    #user_recipes moved to users_helper.rb to abstract for use with ingredients as well as tags

end
