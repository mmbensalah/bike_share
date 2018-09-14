require 'faker'

FactoryBot.define do
  factory :order_item do
    association :order_id, factory: :order
    association :item_id, factory: :item
    price { Faker::Number.decimal(2, 3) }
    quantity { Faker::Number.number(1) }
    title { Faker::UmphreysMcgee.song }
  end
end
