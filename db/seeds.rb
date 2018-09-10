# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# google this thing below
# how to use seed rb to selectively populate development and or production databas
# production:

# development:
# require 'csv'
# require 'time'
# load(Rails.root.join( 'db', 'seeds', "#{Rails.env.downcase}.rb"))



require 'csv'
require 'time'

if Rails.env.production?
  CSV.foreach("./db/csv/station.csv", headers: true, header_converters: :symbol) do |row|
    Station.create(             id:                      row[:id],
                                name:                    row[:name],
                                dock_count:              row[:dock_count],
                                city:                    row[:city],
                                installation_date:       Date.strptime(row[:installation_date],"%m/%d/%Y")
                              )
  end
  CSV.foreach("./db/csv/weather.csv", headers: true, header_converters: :symbol) do |row|
    Condition.find_or_create_by!(
                      date:                         Date.strptime(row[:date],"%m/%d/%Y"),
                      max_temperature:              row[:max_temperature_f].to_i,
                      min_temperature:              row[:min_temperature_f].to_i,
                      mean_temperature:             row[:mean_temperature_f].to_i,
                      mean_humidity:                row[:mean_humidity].to_i,
                      mean_visibility:              row[:mean_visibility_miles].to_i,
                      mean_wind_speed:              row[:mean_wind_speed_mph].to_i,
                      precipitation:                 row[:precipitation_inches].to_f
                      )
  end

  CSV.foreach("./db/csv/trip.csv", headers: true, header_converters: :symbol) do |row|
      Trip.find_or_create_by!(duration:           row[:duration].to_i,
                              start_date:         DateTime.strptime(row[:start_date], "%m/%d/%Y"),
                              end_date:           DateTime.strptime(row[:end_date], "%m/%d/%Y"),
                              bike_id:            row[:bike_id].to_i,
                              subscription_type:  row[:subscription_type],
                              zip_code:           row[:zip_code].to_i,
                              start_station_id:   row[:start_station_id].to_i,
                              end_station_id:     row[:end_station_id].to_i
                              )
    if Trip.all.count > 2500
      break
    end
  end
end


if Rails.env.development?
  CSV.foreach("./db/csv/station.csv", headers: true, header_converters: :symbol) do |row|
    Station.create(             id:                      row[:id],
                                name:                    row[:name],
                                dock_count:              row[:dock_count],
                                city:                    row[:city],
                                installation_date:       Date.strptime(row[:installation_date],"%m/%d/%Y")
                              )
  end
  CSV.foreach("./db/csv/weather.csv", headers: true, header_converters: :symbol) do |row|
    Condition.find_or_create_by!(
                      date:                         Date.strptime(row[:date],"%m/%d/%Y"),
                      max_temperature:              row[:max_temperature_f].to_i,
                      min_temperature:              row[:min_temperature_f].to_i,
                      mean_temperature:             row[:mean_temperature_f].to_i,
                      mean_humidity:                row[:mean_humidity].to_i,
                      mean_visibility:              row[:mean_visibility_miles].to_i,
                      mean_wind_speed:              row[:mean_wind_speed_mph].to_i,
                      precipitation:                 row[:precipitation_inches].to_f
                      )
  end

  CSV.foreach("./db/csv/trip.csv", headers: true, header_converters: :symbol) do |row|
      Trip.find_or_create_by!(duration:           row[:duration].to_i,
                              start_date:         DateTime.strptime(row[:start_date], "%m/%d/%Y"),
                              end_date:           DateTime.strptime(row[:end_date], "%m/%d/%Y"),
                              bike_id:            row[:bike_id].to_i,
                              subscription_type:  row[:subscription_type],
                              zip_code:           row[:zip_code].to_i,
                              start_station_id:   row[:start_station_id].to_i,
                              end_station_id:     row[:end_station_id].to_i
                              )
    if Trip.all.count > 2500
      break
    end
  end
end
