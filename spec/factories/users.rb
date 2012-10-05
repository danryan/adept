# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, aliases: [ :danryan ] do
    username "danryan"
    password "qwerty"
    password_confirmation "qwerty"
    email "dan@appliedawesome.com"
    confirmed_at { Time.now }

    factory :confirmed_user do
      # email { Faker::Internet.email }
      confirmed_at { Time.now }

    end
  end
end
