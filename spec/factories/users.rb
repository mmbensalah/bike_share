require "faker"

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    username { Faker::Internet.username }
    password { Faker::Internet.password }
    role { 0 }
  end

  factory :admin, :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    username { Faker::Internet.username }
    password { Faker::Internet.password }
    role { 1 }
  end
end
