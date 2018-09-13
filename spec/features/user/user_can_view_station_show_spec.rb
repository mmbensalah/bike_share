require "rails_helper"

describe "As an authenticated user" do
  describe "when I visit a station show page" do
    it 'should show analytic data for that station' do
      user = create(:user)
      station = Station.create!(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "2013-08-06")
      station_2 = Station.create!(name: "Castro Station", dock_count: 25, city: "San Francisco", installation_date: "2013-08-06")
      station_3 = Station.create!(name: "SFSU", dock_count: 25, city: "Daly City", installation_date: "2013-08-06")
      trip_1 = Trip.create!(duration: 71, start_date: "2013-08-29", end_date: "2013-08-29", bike_id: 48, subscription_type: "Subscriber", zip_code: 97214, start_station_id: 1, end_station_id: 1)
      trip_2 = Trip.create!(duration: 77, start_date: "2013-08-29", end_date: "2013-08-29", bike_id: 26, subscription_type: "Subscriber", zip_code: 94103, start_station_id: 1, end_station_id: 2)
      trip_3 = Trip.create!(duration: 1099, start_date: "2013-09-05", end_date: "2013-09-05", bike_id: 48, subscription_type: "Customer", zip_code: 10038, start_station_id: 3, end_station_id: 1)
      trip_4 = Trip.create!(duration: 83, start_date: "2013-08-29", end_date: "2013-08-29", bike_id: 48, subscription_type: "Subscriber", zip_code: 94103, start_station_id: 1, end_station_id: 1)
      trip_5 = Trip.create!(duration: 109, start_date: "2013-08-29", end_date: "2013-08-29", bike_id: 679, subscription_type: "Subscriber", zip_code: 95112, start_station_id: 1, end_station_id: 2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit station_path(station)

      expect(page).to have_content("Number of rides started here: #{station.ride_count("started")}")
      expect(page).to have_content("Number of rides ended here: #{station.ride_count("ended")}")
      expect(page).to have_content("Most popular Destination Station: #{station.destination_station.name} with #{station.destination_station.station_count} arrivals")
      expect(page).to have_content("Most popular Origination Station: #{station.origination_station.name} with #{station.origination_station.station_count} departures")
      expect(page).to have_content("Date of most trips: #{station.most_trips.keys.first} with #{station.most_trips.values.first} rides")
      expect(page).to have_content("Most frequent rider zip code: #{station.top_zips.keys.first} with #{station.top_zips.values.first} rides")
      expect(page).to have_content("Most used bike: #{station.top_bike.keys.first} (id) with #{station.top_bike.values.first} rides")
    end
  end
end
