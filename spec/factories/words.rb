# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :word do
    word "MyString"
    trick "MyString"
    additional_info "MyString"
  end
end
