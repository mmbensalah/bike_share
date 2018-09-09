require 'faker'

FactoryBot.define do
  factory :items do
    title { Faker::Title.title }
    price { Faker::Number.decimal(2) }
    # thumbnail
    description { Faker::ChuckNorris.fact }
    status "active"
  end
end
