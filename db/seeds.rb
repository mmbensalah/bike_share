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

Item.destroy_all

Item.create(title: "Handlebars", price: "35.00", image: './assets/bike_gear.jpg', description: 'Use to steer your bike.', status: 0)
Item.create(title: "Pedals", price: "12.50", image: './assets/bike_gear.jpg', description: 'Use to make your bike go.', status: 0)
Item.create(title: "Streamers", price: "5.00", image: './assets/bike_gear.jpg', description: 'Make your bike looke cool.', status: 0)
Item.create(title: "Water Bottle Holder", price: "6.99", image: './assets/bike_gear.jpg', description: 'Have a place to hold your water.', status: 0)
Item.create(title: "Lights", price: "25.00", image: './assets/bike_gear.jpg', description: 'Set of 2. Make sure people see you!', status: 0)
Item.create(title: "Pump", price: "7.00", image: './assets/bike_shoe.jpg', description: 'Pump up your tires.', status: 0)
Item.create(title: "More Stuff", price: "100.00", image: './assets/bike_show.jpg', description: 'You can always use more stuff', status: 0)
Item.create(title: "Tires", price: "55.00", image: './assets/bike_show.jpg', description: 'To go places', status: 0)
Item.create(title: "Paint", price: "2.00", image: './assets/bike_show.jpg', description: 'Can you paint a bike? Let\'s try!', status: 0)
Item.create(title: "Grips", price: "14.90", image: './assets/bike_show.jpg', description: 'The better to grip the bike.', status: 0)
Item.create(title: "Grips", price: "84.90", image: './assets/bike_show.jpg', description: 'No one was buying these, they\' top of the line', status: 1)
Item.create(title: "Bike Seat", price: "40.00", image: './assets/bike_show.jpg', description: 'Keep your bum comfty!', status: 0)

require 'csv'
require 'time'


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
    Trip.find_or_create_by!(
                            id:                 row[:id].to_i,
                            duration:           row[:duration].to_i,
                            start_date:         DateTime.strptime(row[:start_date], "%m/%d/%Y"),
                            end_date:           DateTime.strptime(row[:end_date], "%m/%d/%Y"),
                            bike_id:            row[:bike_id].to_i,
                            subscription_type:  row[:subscription_type],
                            zip_code:           row[:zip_code].to_i,
                            start_station_id:   row[:start_station_id].to_i,
                            end_station_id:     row[:end_station_id].to_i
                            )

end

ActiveRecord::Base.connection.reset_pk_sequence!('stations')
ActiveRecord::Base.connection.reset_pk_sequence!('trips')
ActiveRecord::Base.connection.reset_pk_sequence!('conditions')
