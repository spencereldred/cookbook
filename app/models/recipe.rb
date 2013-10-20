class Recipe < ActiveRecord::Base
  attr_accessible :title, :book_id, :chapter, :page_number, :directions, :image
  ###### relationships
  belongs_to :book
  has_many :ingredient_recipes
  has_many :ingredients, through: :ingredient_recipes

end
