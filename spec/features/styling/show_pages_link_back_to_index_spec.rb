require 'rails_helper'

describe 'show pages have link to index' do
  describe 'conditions show page' do
    it 'links to index page' do

      condition = create(:condition)

      visit condition_path(condition)
      click_on "Back to All Conditions"
      expect(current_path).to eq(conditions_path)

    end
  end
  describe "trips show page" do
    it 'links to index page' do

      trip = create(:trip)

      visit trip_path(trip)
      click_on "Back to All Trips"
      expect(current_path).to eq(trips_path)
    end
  end
  describe 'stations show page' do
    it 'links to index page' do

      station = create(:station)
      station.start_trips.create(duration: 71, start_date: "2013-08-29", end_date: "2013-08-29", bike_id: 48, subscription_type: "Subscriber", zip_code: 97214, start_station_id: 1, end_station_id: 1)

      visit station_path(station)
      click_on "Back to All Stations"
      expect(current_path).to eq(stations_path)
    end
  end
end
