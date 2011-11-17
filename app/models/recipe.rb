class Recipe < ActiveRecord::Base
  has_many :supplies
  has_many :ingredients, :through => :supplies
  has_and_belongs_to_many :tags
  
  accepts_nested_attributes_for :supplies, :tags
  
  def total_time
    self.cook_time+self.prep_time
  end
  
  def as_json(options={})
    {
      :id=>self.id,
      :name=>self.name,
      :description=>self.description,
      :steps=>self.steps,
      :time=>{:cook_time=>self.cook_time, :prep_time=> self.prep_time, :total_time=>self.total_time},
      :ingredients=>self.supplies,
      }
    end
  
end
