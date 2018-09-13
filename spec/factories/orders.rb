require 'faker'

FactoryBot.define do
  factory :order do
    association :user_id, factory: :user
  end
end
