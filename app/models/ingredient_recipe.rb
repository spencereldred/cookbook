class IngredientRecipe < ActiveRecord::Base
  attr_accessible :recipe_id, :ingredient_id, :quantity
  ##### relationships
  belongs_to :recipe
  belongs_to :ingredient
end
