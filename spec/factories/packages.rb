# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  # include ActionDispatch::TestProcess

  factory :package do
    component "main"

    # factory :package_with_file do
      # before(:create) do |package, evaluator|
        # package.file = File.open(Rails.root + '/spec/fixtures/ruby.deb')
      # end
    # end

    factory :package_with_distribution do
      after(:create) do |package, evaluator|
        FactoryGirl.create(:distribution, packages: [ package ])
      end
    end
  end
end
