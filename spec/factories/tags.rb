# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag do
    name {Forgery(:lorem_ipsum).words rand(2)+1, :random=>true}
  end
end
