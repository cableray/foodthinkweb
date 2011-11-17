class Ingredient < ActiveRecord::Base
  has_many :supplies
  has_many :recipes, :through => :supplies
end
