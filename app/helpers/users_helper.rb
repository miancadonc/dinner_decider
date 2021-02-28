module UsersHelper

    def random_recipes(user, number)
        user.recipes.sample(number)
    end

end
