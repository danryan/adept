# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :repository do
    name "test"
    type 'apt'
    
    factory :repository_with_distributions do
      after(:create) do |repository, evaluator|
        FactoryGirl.create(:lucid, repository: repository)
      end
    end

    factory :apt_repository do
      type 'apt'
    end

    factory :yum_repository do
      type 'yum'
    end

  end
end
