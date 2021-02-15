class CreateRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_ingredients do |t|
      t.string :unit
      t.float :magnitude

      t.timestamps
    end
  end
end
