# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "danryan"
    email "dan@appliedawesome.com"
    password "qwerty"
    password_confirmation "qwerty"
  end
end
