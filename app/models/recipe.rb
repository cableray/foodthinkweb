class Recipe < ActiveRecord::Base
  has_many :supplies
  has_many :ingredients, :through => :supplies
  has_and_belongs_to_many :tags
end
