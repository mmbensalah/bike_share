require 'faker'

FactoryBot.define do
  factory :station do
    name { Faker::Name.name }
    dock_count { Faker::Number.number(1) }
    city { Faker::Address.city }
    installation_date { Faker::Time.between(DateTime.now - 1, DateTime.now) }
  end
end
