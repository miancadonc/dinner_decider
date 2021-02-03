//MODELS

User:

- user_name: string
- password: password digest (use bcrypt and activerecord has_secure_password for native login; also, use omniauth from github)

- has_many :recipe_books
- has_many :recipes, through: :recipe_books

RecipeBook:

- name: string (maybe make a validation for max length here. Definitely validate presence)
- description: string


- has_many :recipes
- belongs_to :user

Recipe:

- name: string
- description: string
- difficulty: integer (use a 5 star system for display, so only allow for values between 0-10)
- tastiness_rating: integer (ditto from difficulty)
- calorie_count: integer (optional for user; validate for integer)
- external_link: string (undecided on whether to keep this attribute)

- belongs_to :recipe_book

Ingredient:

- name: string

- has_many :recipe_ingredients
- has_many :recipes, through: :recipe_ingredients
- has_many :tags

Tag:

- name: string

- has_many :recipes

//JOIN MODELS

RecipeIngredient:

RecipeTag:

//REACH MODELS

Comment:


//REACH FEATURES

- possibly allow users to see, rate, and copy other users recipes. How would they copy them?