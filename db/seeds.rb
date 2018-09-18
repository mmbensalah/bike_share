require 'csv'
require 'time'

Item.destroy_all
User.destroy_all
User.destroy_all
Order.destroy_all
OrderItem.destroy_all

item_1 = Item.create(title: "Handlebars", price: "35.00", image: 'bike_gear.jpg', description: 'Use to steer your bike.', status: 0)
item_2 = Item.create(title: "Pedals", price: "12.50", image: 'bike_gear.jpg', description: 'Use to make your bike go.', status: 0)
item_3 = Item.create(title: "Streamers", price: "5.00", image: 'bike_gear.jpg', description: 'Make your bike looke cool.', status: 0)
item_4 = Item.create(title: "Water Bottle Holder", price: "6.99", image: 'bike_gear.jpg', description: 'Have a place to hold your water.', status: 0)
item_5 = Item.create(title: "Lights", price: "25.00", image: 'bike_gear.jpg', description: 'Set of 2. Make sure people see you!', status: 0)
item_6 = Item.create(title: "Pump", price: "7.00", image: 'bike_shoe.jpg', description: 'Pump up your tires.', status: 0)
item_7 = Item.create(title: "More Stuff", price: "100.00", image: 'bike_shoe.jpg', description: 'You can always use more stuff', status: 0)
item_8 = Item.create(title: "Tires", price: "55.00", image: 'bike_shoe.jpg', description: 'To go places', status: 0)
item_9 = Item.create(title: "Paint", price: "2.00", image: 'bike_shoe.jpg', description: 'Can you paint a bike? Let\'s try!', status: 0)
item_10 = Item.create(title: "Grips", price: "14.90", image: 'bike_shoe.jpg', description: 'The better to grip the bike.', status: 0)
item_11 = Item.create(title: "Grips 2", price: "84.90", image: 'bike_shoe.jpg', description: 'No one was buying these, they\' top of the line', status: 1)
item_12 = Item.create(title: "Bike Seat", price: "40.00", image: 'bike_shoe.jpg', description: 'Keep your bum comfty!', status: 0)

user_1 = User.create(first_name: "Kat", last_name: "Yruegas", email: "kat@email.com", username: "katuser", password: "test", role: 0, address: "Test Address")
user_2 = User.create(first_name: "Kat", last_name: "Yruegas", email: "katadmin@email.com", username: "katadmin", password: "test", role: 1, address: "Test Address")
user_3 = User.create(first_name: "Miriam", last_name: "Bensalah", email: "mir@email.com", username: "miriamuser", password: "test", role: 0, address: "Test Address")
user_4 = User.create(first_name: "Miriam", last_name: "Bensalah", email: "miradmin@email.com", username: "miriamadmin", password: "test", role: 1, address: "Test Address")
user_5 = User.create(first_name: "Dylan", last_name: "Meskis", email: "dyl@email.com", username: "dylanuser", password: "test", role: 0, address: "Test Address")
user_6 = User.create(first_name: "Dylan", last_name: "Meskis", email: "dyladmin@email.com", username: "dylanadmin", password: "test", role: 1, address: "Test Address")

order_1 = user_1.orders.create!(status: 1)
order_2 = user_1.orders.create!(status: 0)
order_3 = user_1.orders.create!(status: 1)
order_4 = user_1.orders.create!(status: 2)
order_5 = user_1.orders.create!(status: 3)
order_6 = user_1.orders.create!(status: 1)
order_7 = user_2.orders.create!(status: 1)
order_8 = user_2.orders.create!(status: 0)
order_9 = user_2.orders.create!(status: 1)
order_10 = user_2.orders.create!(status: 2)
order_11 = user_2.orders.create!(status: 3)
order_12 = user_2.orders.create!(status: 1)
order_13 = user_3.orders.create!(status: 1)
order_14 = user_3.orders.create!(status: 0)
order_15 = user_3.orders.create!(status: 1)
order_16 = user_3.orders.create!(status: 2)
order_17 = user_3.orders.create!(status: 3)
order_18 = user_3.orders.create!(status: 1)

OrderItem.create(order_id: order_1.id, item_id: item_1.id, price: 35.00, quantity: 2)
OrderItem.create(order_id: order_2.id, item_id: item_2.id, price: 12.50, quantity: 1)
OrderItem.create(order_id: order_3.id, item_id: item_3.id, price: 5.00, quantity: 30)
OrderItem.create(order_id: order_4.id, item_id: item_4.id, price: 6.99, quantity: 3)
OrderItem.create(order_id: order_5.id, item_id: item_7.id, price: 100.00, quantity: 1)
OrderItem.create(order_id: order_6.id, item_id: item_8.id, price: 55.00, quantity: 2)
OrderItem.create(order_id: order_7.id, item_id: item_10.id, price: 15.90, quantity: 2)
OrderItem.create(order_id: order_8.id, item_id: item_10.id, price: 24.90, quantity: 2)
OrderItem.create(order_id: order_8.id, item_id: item_10.id, price: 14.90, quantity: 2)
OrderItem.create(order_id: order_10.id, item_id: item_10.id, price: 19.90, quantity: 2)
OrderItem.create(order_id: order_11.id, item_id: item_10.id, price: 20.90, quantity: 2)
OrderItem.create(order_id: order_12.id, item_id: item_10.id, price: 14.00, quantity: 2)
OrderItem.create(order_id: order_13.id, item_id: item_10.id, price: 15.50, quantity: 2)
OrderItem.create(order_id: order_14.id, item_id: item_10.id, price: 14.90, quantity: 2)
OrderItem.create(order_id: order_15.id, item_id: item_10.id, price: 14.90, quantity: 2)
OrderItem.create(order_id: order_16.id, item_id: item_10.id, price: 14.90, quantity: 2)
OrderItem.create(order_id: order_17.id, item_id: item_10.id, price: 14.90, quantity: 2)
OrderItem.create(order_id: order_18.id, item_id: item_10.id, price: 14.90, quantity: 2)
OrderItem.create(order_id: order_18.id, item_id: item_10.id, price: 14.90, quantity: 2)
OrderItem.create(order_id: order_17.id, item_id: item_10.id, price: 14.90, quantity: 2)
OrderItem.create(order_id: order_16.id, item_id: item_10.id, price: 14.90, quantity: 2)


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
ActiveRecord::Base.connection.reset_pk_sequence!('items')
ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('orders')
ActiveRecord::Base.connection.reset_pk_sequence!('order_items')
