module UsersHelper

    def random_recipes(user, number)
        user.recipes.sample(number)
    end

    # user_ingredients(user) is basically a rehash of the no_blank_ingredients method in recipe_ingredients_helper.rb that takes in a different collection
    # source of ingredients - maybe they can be combined somewhere

    def user_ingredients(user)
        ingredients = user.ingredients.uniq.select {|ing| ing.name != ""  }
    end

end
