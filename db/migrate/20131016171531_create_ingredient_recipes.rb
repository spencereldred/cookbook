class CreateIngredientRecipes < ActiveRecord::Migration
  def change
    create_table :ingredient_recipes do |t|
      t.references   :ingredient
      t.references   :recipe
      t.string          :quantity

      t.timestamps
    end
  end
end
