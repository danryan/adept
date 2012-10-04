# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, aliases: [ :danryan ] do
    username "danryan"
    email "dan@appliedawesome.com"
    password "qwerty"
    password_confirmation "qwerty"

    factory :confirmed_user do
      confirmed_at { Time.now }
    end
  end
end
