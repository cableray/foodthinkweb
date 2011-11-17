class Supply < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :recipe
  
  accepts_nested_attributes_for :ingredient
  
  scope :all_for_recipe, lambda {|recipe_id| where(:recipe_id=>recipe_id)}
  
  def as_json(options={})
    {
      :id=>self.ingredient_id,
      :name=>self.ingredient.name,
      :description=>self.ingredient.description,
      :amount=>{:unit=>self.unit, :quantity=>self.amount},
    }
  end
  
end
