# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :app_setting do
    key "MyKey"
    value "MyValue"
  end
end
