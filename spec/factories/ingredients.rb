# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient do
    name {Forgery(:lorem_ipsum).words 3, :random=>true}
    description {Forgery(:lorem_ipsum).words 50, :random=>true}
  end
end
