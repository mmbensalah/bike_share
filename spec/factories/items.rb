require 'faker'

FactoryBot.define do
  factory :item do
    title { Faker::Name.name }
    price { Faker::Number.decimal(2) }
    image { Faker::Internet.url }
    description { Faker::ChuckNorris.fact }
    status "active"
  end
end
