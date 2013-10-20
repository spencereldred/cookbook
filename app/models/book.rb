class Book < ActiveRecord::Base
  attr_accessible :title, :author, :cuisine, :publication_date
  ###### relationships
  has_many :recipes

  ###### validations
  validates :title, presence: :true
  validates :author, presence: :true
  validates :cuisine, presence: :true
  validates :publication_date, presence: :true


end
