# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :package do
    name "foo"
    control "MyText"
    component "main"
  end
end
