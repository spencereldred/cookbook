class Ingredient < ActiveRecord::Base
  attr_accessible :name, :category
  ##### relationships
  has_many :ingredient_recipes
  has_many :recipies, through: :ingredient_recipes
end
