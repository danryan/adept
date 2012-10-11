# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :distribution do
    origin "adept.io"
    label "apt repo"
    architecture_list [ "amd64", "i386" ]
    description { "apt repo for #{codename}" }
    component_list [ "main" ]

    factory :lucid do
      codename "lucid"
    end

    factory :precise do
      codename "precise"
    end

    factory :precise_with_package do
      codename "precise"
      after(:create) do |distribution, evaluator|
        FactoryGirl.create(:package, distributions: [ distribution ])
      end
    end

    factory :lucid_with_package do
      codename "precise"
      after(:create) do |distribution, evaluator|
        FactoryGirl.create(:package, distributions: [ distribution ])
      end
    end
  end
end
