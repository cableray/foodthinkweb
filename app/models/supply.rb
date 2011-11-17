class Supply < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :recipe
  
  accepts_nested_attributes_for :inredient
end
