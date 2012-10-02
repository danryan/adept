# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :repository do
    name "test"

    factory :repository_with_distributions do
      after(:create) do |repository, evaluator|
        FactoryGirl.create(:lucid, repository: repository)
      end
    end
  end
end
