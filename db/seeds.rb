# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'time'

CSV.foreach("./db/csv/station.csv", headers: true, header_converters: :symbol) do |row|
  Station.create( name:                    row[:name],
                              dock_count:              row[:dock_count],
                              city:                    row[:city],
                              installation_date:       Date.strptime(row[:installation_date],"%m/%d/%Y")
                            )
end
CSV.foreach("./db/csv/weather.csv", headers: true, header_converters: :symbol) do |row|
  Condition.find_or_create_by!(
                    date:                         Date.strptime(row[:date],"%m/%d/%Y"),
                    max_temperature:              row[:max_temperature].to_i,
                    min_temperature:              row[:min_temperature].to_i,
                    mean_temperature:             row[:mean_temperature].to_i,
                    mean_humidity:                row[:mean_humidity].to_i,
                    mean_visibility:              row[:mean_visibility_miles].to_i,
                    mean_wind_speed:              row[:mean_wind_speed_mph].to_i,
                    precipitation:                 row[:precipitation_inches].to_f
                    )
end
