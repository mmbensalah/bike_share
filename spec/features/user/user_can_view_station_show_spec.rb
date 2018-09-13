require "rails_helper"

describe "As an authenticated user" do
  describe "when I visit a station show page" do
    it 'should show analytic data for that station' do
      user = create(:user)
      station = Station.create!(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "2013-08-06")
      Station.create!(name: "Castro Station", dock_count: 25, city: "San Francisco", installation_date: "2013-08-06")
      Station.create!(name: "SFSU", dock_count: 25, city: "Daly City", installation_date: "2013-08-06")
      trip_1 = station.trips.create!(duration: 71, start_date: "2013-08-29", end_date: "2013-08-29", bike_id: 48, subscription_type: "Subscriber", zip_code: 97214, start_station_id: 1, end_station_id: 1)
      trip_2 = station.trips.create!(duration: 77, start_date: "2013-08-29", end_date: "2013-08-29", bike_id: 26, subscription_type: "Subscriber", zip_code: 94103, start_station_id: 1, end_station_id: 2)
      trip_3 = station.trips.create!(duration: 1099, start_date: "2013-09-05", end_date: "2013-09-05", bike_id: 48, subscription_type: "Customer", zip_code: 10038, start_station_id: 3, end_station_id: 1)
      trip_4 = station.trips.create!(duration: 83, start_date: "2013-08-29", end_date: "2013-08-29", bike_id: 319, subscription_type: "Subscriber", zip_code: 94103, start_station_id: 1, end_station_id: 3)
      trip_5 = station.trips.create!(duration: 109, start_date: "2013-08-29", end_date: "2013-08-29", bike_id: 679, subscription_type: "Subscriber", zip_code: 95112, start_station_id: 1, end_station_id: 2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit station_path(station)

      expect(page).to have_content("Number of rides started here: #{station.ride_count(started)}")
      expect(page).to have_content("Number of rides ending here: #{station.ride_count(ended)}")
      expect(page).to have_content("Most frequent Destination Station: #{station.destination_station}")
      expect(page).to have_content("Most frequent Origination Station: #{station.origination_station}")
      expect(page).to have_content("Date of highest trips: #{station.date_most_trips}")
      expect(page).to have_content("Most frequent rider zip code: #{station.highest_zip_code}")
      expect(page).to have_content("Most used bike: #{station.most_used_bike}")
    end
  end
end
