# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	name 'Ziyi'
  	sequence(:email) { |n| "email#{n}@gmail.com" }
  	password 'password'
  end
end
