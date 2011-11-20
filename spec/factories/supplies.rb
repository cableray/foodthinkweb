# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :supply do
    amount {Random.new.rand(1..4)}
    unit {%w(Tablespoons Teaspoons Cups Pints Ounces Fluid\ Ounces Gallons Liters Pinches Dashes).sample}
  end
  
  factory :supply_with_ingredient, :parent=>:supply do
    association :ingredient
  end
end
