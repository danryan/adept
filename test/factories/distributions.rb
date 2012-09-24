# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :distribution do
    origin "MyString"
    label "MyString"
    codename "MyString"
    architectures "MyText"
    description "MyString"
    sign_with "MyString"
    components "MyText"
  end
end
