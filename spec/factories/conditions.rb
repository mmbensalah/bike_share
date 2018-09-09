require 'faker'
FactoryBot.define do
  factory :condition do
    date { Faker::Date.between(2.days.ago, Date.today) }
    max_temperature { Faker::Number.between(0, 115) }
    min_temperature { Faker::Number.between(0, 115) }
    mean_temperature { Faker::Number.between(0, 115) }
    mean_humidity { Faker::Number.between(0, 100) }
    mean_visibility { Faker::Number.between(0, 50) }
    mean_wind_speed { Faker::Number.between(0, 50) }
    precipitation { Faker::Number.between(0, 50) }
  end
end
