require 'rails_helper'

describe 'index pages have link to show' do
  describe 'conditions show page' do
    it 'links to show page' do

      condition = create(:condition)

      visit conditions_path
      save_and_open_page
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

      visit stations_path
      click_on "View this Station"
      expect(current_path).to eq(station_path(station))
    end
  end
end
