# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe do
    name "MyString"
    cook_time 1
    prep_time 1
    description "MyText"
    steps "MyText"
  end
end
