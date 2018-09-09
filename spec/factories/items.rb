require 'faker'

FactoryBot.define do
  factory :items do
    title { Faker::Title.title }
    price { Faker::Number.decimal(2) }
    # image
    description { Faker::ChuckNorris.fact }
    status "active"
  end
end
