require 'faker'

FactoryBot.define do
  factory :trip do
    duration { Faker::Number.between(120, 20000) }
    start_date { Faker::Time.between(DateTime.now - 1, DateTime.now) }
    end_date DateTime.now
    bike_id { Faker::Number.between(1, 100) }
    subscription_type "Placeholder"
    zip_code { Faker::Number.number(5) }
    start_station_id { Faker::Number.between(1, 40)}
    end_station_id { Faker::Number.between(1, 40)}
  end
end
