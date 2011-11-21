class Supply < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :recipe
  
  validates :unit, :inclusion => { :in => %w(Tablespoons Teaspoons Cups Pints Ounces Fluid\ Ounces Gallons Liters Pinches Dashes),
      :message => "%{value} is not a valid unit" }
  
  accepts_nested_attributes_for :ingredient
  
  scope :all_for_recipe, lambda {|recipe_id| where(:recipe_id=>recipe_id)}
  

  before_save :link_ingr_by_name
  def name=(value)
    attribute_will_change!(:name) #not sure if this line is needed
    @name=value
  end
  def name
    return ingredient.name unless ingredient.nil?
    return ''
  end
  
  def link_ingr_by_name
    self.ingredient= Ingredient.find_or_create_by_name(@name)
  end
  
  def as_json(options={})
    {
      :id=>self.ingredient_id,
      :name=>self.ingredient.name,
      :description=>self.ingredient.description,
      :amount=>{:unit=>self.unit, :quantity=>self.amount},
    }
  end
  
end
