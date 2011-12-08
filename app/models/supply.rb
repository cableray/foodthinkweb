class Supply < ActiveRecord::Base
  attr_accessible :name, :amount_tokens
  belongs_to :ingredient
  belongs_to :recipe
  belongs_to :unit

  attr_reader :amount_tokens
  
  #validates :unit, :inclusion => { :in => %w(Tablespoons Teaspoons Cups Pints Ounces Fluid\ Ounces Gallons Liters Pinches Dashes),
  #    :message => "%{value} is not a valid unit" }
  
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

  def amount_tokens=(ids)
    self.amounts = ids.split(',')
  end
  
  def self.parse_line_item(line_item)

    tokens = line_item.match(/^\s*(?<amount>[0-9]*\s[0-9]+\/[0-9]+|[0-9]+\/[0-9]+|[0-9]*\.?[0-9]+)\s+(?<unit>[A-Za-z]+)\s+(?<ingredient>[A-Za-z\s]+)$/)
    supply=Supply.new

    supply.amount = Fractional.to_f(tokens[:amount])
    supply.unit = Unit.find_or_create_by_name(tokens[:unit])
    supply.ingredient = Ingredient.find_or_create_by_name(tokens[:ingredient])
    supply
  end

end
