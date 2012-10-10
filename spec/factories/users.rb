# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name                  { Faker::Name.name }
    username              { Faker::Lorem.characters(8) }
    email                 { Faker::Internet.email }
    password              "qwerty"
    password_confirmation "qwerty"
    confirmed_at          { Time.now }
    after :create do |user, eval|
      user.add_role :user
    end

    factory :danryan do
      name                  "Dan Ryan"
      username              "danryan"
      password              "qwerty"
      password_confirmation "qwerty"
      email                 "dan@appliedawesome.com"
      after :create do |user, eval|
        user.add_role :admin
      end
    end

    factory :unconfirmed_user do
      confirmed_at nil
    end

    factory :admin do
      after :create do |user, eval|
        user.add_role :admin
      end
    end

    factory :user_with_apt_repository do
      after(:create) do |user, evaluator|
        FactoryGirl.create(:apt_repository, user: user)
      end
    end
  end
end
