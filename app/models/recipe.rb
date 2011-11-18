class Recipe < ActiveRecord::Base
  has_many :supplies
  has_many :ingredients, :through => :supplies
  has_and_belongs_to_many :tags
  
  accepts_nested_attributes_for :supplies, :tags
  
  def total_time
    self.cook_time+self.prep_time
  end
  

  
end
