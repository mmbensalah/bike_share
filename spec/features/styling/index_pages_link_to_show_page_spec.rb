require 'rails_helper'

describe 'index pages have link to show' do
  describe 'conditions show page' do
    it 'links to show page' do

      condition = create(:condition)

      visit conditions_path
      click_on "View this Condition"
      expect(current_path).to eq(condition_path(condition))

    end
  end
  describe "trips index page" do
    it 'links to show page' do

      trip = create(:trip)

      visit trips_path
      click_on "View this Trip"
      expect(current_path).to eq(trip_path(trip))
    end
  end
  describe 'stations index page' do
    it 'links to index page' do

      station = create(:station)
      station.start_trips.create(duration: 71, start_date: "2013-08-29", end_date: "2013-08-29", bike_id: 48, subscription_type: "Subscriber", zip_code: 97214, start_station_id: 1, end_station_id: 1)
      

      visit stations_path
      click_on "View this Station"
      expect(current_path).to eq(station_path(station))
    end
  end
end
