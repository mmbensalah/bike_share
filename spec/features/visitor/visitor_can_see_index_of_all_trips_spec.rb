require 'rails_helper'

describe 'visitor can see all trips' do
  describe 'on the trips index page' do
    it 'shows all trips along with all their attributes' do
      trip = create(:trip)
      trip_2 = create(:trip)

      visit trips_path

      expect(page).to have_content(trip.duration)
      expect(page).to have_content(trip.start_date.in_time_zone("MST").strftime("%m/%d/%Y %I:%M %P"))
      expect(page).to have_content(trip.end_date.in_time_zone("MST").strftime("%m/%d/%Y %I:%M %P"))
      expect(page).to have_content(trip.bike_id)
      expect(page).to have_content(trip.subscription_type)
      expect(page).to have_content(trip.zip_code)
      expect(page).to have_content(trip.start_station.name)
      expect(page).to have_content(trip.end_station.name)
      expect(page).to have_content(trip_2.duration)
      expect(page).to have_content(trip_2.start_date.in_time_zone("MST").strftime("%m/%d/%Y %I:%M %P"))
      expect(page).to have_content(trip_2.end_date.in_time_zone("MST").strftime("%m/%d/%Y %I:%M %P"))
      expect(page).to have_content(trip_2.bike_id)
      expect(page).to have_content(trip_2.subscription_type)
      expect(page).to have_content(trip_2.zip_code)
      expect(page).to have_content(trip_2.start_station.name)
      expect(page).to have_content(trip_2.end_station.name)
    end

    describe 'on the trips index page' do
      it 'shows the first 30 trips along with all their attributes' do
        trips = create_list(:trip, 35)

        visit trips_path

        expect(page).to have_css(".trip", count: 30)

        click_on("Next")
        expect(page).to have_css(".trip", count: 5)
      end
    end
  end
end
