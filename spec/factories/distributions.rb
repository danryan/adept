# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :distribution do
    origin "adept.io"
    label "apt repo"
    codename "lucid"
    architectures [ "amd64", "i386" ]
    description "apt repo for lucid"
    sign_with "sysadmin@adept.io"
    components [ "main" ]
  end
end
