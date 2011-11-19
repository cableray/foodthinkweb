# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe do
    name {Forgery(:lorem_ipsum).words 3, :random=>true}
    cook_time Random.new.rand(1..60).minutes
    prep_time Random.new.rand(1..60).minutes
    description {Forgery(:lorem_ipsum).words 50, :random=>true}
    steps {Forgery(:lorem_ipsum).sentences 5, :random=>true}
  end
  
  factory :recipe_with_supplies, :parent=>:recipe do
    after_create {|recipe| FactoryGirl.create_list :supply_with_ingredient, Random.new.rand(3..15), :recipe=>recipe}
  end
  
  factory :recipe_with_tags, :parent=>:recipe do
    after_create {|recipe| FactoryGirl.create_list :tag, Random.new.rand(1..15), :recipe=>recipe}
  end
  
  factory :recipe_with_s_t, :parent=>:recipe do
    after_create do |recipe| 
      FactoryGirl.create_list :supply_with_ingredient, Random.new.rand(3..15), :recipe=>recipe
      FactoryGirl.create_list :tag, Random.new.rand(1..15), :recipes=>[recipe]
    end
  end
  
end
