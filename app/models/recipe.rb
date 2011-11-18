class Recipe < ActiveRecord::Base
  has_many :supplies
  has_many :ingredients, :through => :supplies
  has_and_belongs_to_many :tags
  
  accepts_nested_attributes_for :supplies, :tags
  
  searchable do
    text :name, :boost=>10
    text :description, :boost=>2
    text :steps
    text :ingredients, :boost=>5 do
      ingredients.map(&:name)
    end
    text :tags, :boost=>5 do
      tags.map(&:name)
    end
  end
  
  def total_time
    self.cook_time+self.prep_time
  end
  

  
end
