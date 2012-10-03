# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  # include ActionDispatch::TestProcess

  factory :package do
    component "main"

    after(:build) do |package, evaluator|
      package.name = "ruby1.9.1"
      package.file = File.open(Rails.root + 'spec/fixtures/ruby.deb')
    end
    # factory :package_with_file do
      # before(:create) do |package, evaluator|
        # package.file = File.open(Rails.root + '/spec/fixtures/ruby.deb')
      # end
    # end

    factory :package_with_distribution do
      after(:create) do |package, evaluator|
        FactoryGirl.create(:lucid, packages: [ package ])
      end
    end
  end
end
