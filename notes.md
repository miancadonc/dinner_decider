//MODELS

User:

- user_name: string
- password: password digest (use bcrypt and activerecord has_secure_password for native login; also, use omniauth from github)

- has_many :recipe_books
- has_many :recipes

RecipeBook:

- name: string (maybe make a validation for max length here. Definitely validate presence)
- description: string


- has_many :recipes
- belongs_to :user
- has_many :tags, through: :recipes

    Must choose between either allowing direct ownership of recipes by users or instantiating a personal recipe book on user creation and making it a placeholder selection.

    Should recipes belong to a single recipe_book or many?

Recipe:

- name: string
    validates presence
- description: string
- difficulty: integer (use a 5 star system for display, so only allow for values between 0-10)
    validates numericality
- tastiness_rating: integer (ditto from difficulty)
    validates numericality
- calorie_count: integer (optional for user; validate for integer)
    validates numericality
    
- external_link: string (undecided on whether to keep this attribute)
- image: string (reach)
- prep_time/cook_time/total_time : integer (put units in in view- store as integer for addition)(reach)

- has_many :recipe_books
    Again I'm not sure if I want to make a join model for a has_many to has_many or instead has a belongs_to with recipe_books
<!-- - has_many :users, through: :recipe_books --> recipes should be copied instead of shared so that updating one user's version doesn't change others
- belongs_to :user
- has_many :recipe_ingredients
- has_many :ingredients, through: :recipe_ingredients
- has_many :recipe_tags
- has_many :tags, through: :recipe_tags

Ingredient:

- name: string

- has_many :recipe_ingredients
- has_many :recipes, through: :recipe_ingredients

Tag:

- name: string

- has_many :recipe_tags
- has_many :recipes, through: :recipe_tags

- has_many :recipe_books, through: :recipes

//JOIN MODELS

RecipeIngredient:

- unit: string (maybe use checkbox)
- magnitude: integer (validate numericality)

- belongs_to :recipes
- belongs_to :ingredients

RecipeTag:

- belongs_to :recipe
- belongs_to :tag

//REACH MODELS

Comment:

- text :string

- belongs_to :recipe
- belongs_to :user

maybe keeps track of created_at


//REACH FEATURES

- possibly allow users to see, rate, and copy other users recipes. How would they copy them?