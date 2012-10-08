# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, aliases: [ :danryan ] do
    username "danryan"
    password "qwerty"
    password_confirmation "qwerty"
    email "dan@appliedawesome.com"
    confirmed_at { Time.now }

    factory :unconfirmed_user do
      # email { Faker::Internet.email }
      confirmed_at nil

    end

    factory :user_with_apt_repository do
      after(:create) do |user, evaluator|
        FactoryGirl.create(:apt_repository, user: user)
      end
    end
  end
end
