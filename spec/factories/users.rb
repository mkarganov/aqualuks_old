# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "MyString"
    name "MyString"
    password_digest "MyString"
    password_reset_token "MyString"
    password_reset_sent_at "MyString"
  end
end
