# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    customer_name "MyString"
    address "MyText"
    phone 1
    comment "MyText"
  end
end
