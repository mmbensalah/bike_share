require 'rails_helper'

describe 'visitor can see all trips' do
  describe 'on the trips index page' do
    it 'shows all trips along with all their attributes' do
      trip = create(:trip)
      trip_2 = create(:trip)

      visit trips_path

      expect(page).to have_content(trip.duration)
      expect(page).to have_content(trip.start_date)
      expect(page).to have_content(trip.end_date)
      expect(page).to have_content(trip.bike_id)
      expect(page).to have_content(trip.subscription_type)
      expect(page).to have_content(trip.zip_code)
      expect(page).to have_content(trip.start_station_id)
      expect(page).to have_content(trip.end_station_id)
      expect(page).to have_content(trip_2.duration)
      expect(page).to have_content(trip_2.start_date)
      expect(page).to have_content(trip_2.end_date)
      expect(page).to have_content(trip_2.bike_id)
      expect(page).to have_content(trip_2.subscription_type)
      expect(page).to have_content(trip_2.zip_code)
      expect(page).to have_content(trip_2.start_station_id)
      expect(page).to have_content(trip_2.end_station_id)

    end
    describe 'on the trips index page' do
      xit 'shows the first 30 trips along with all their attributes' do
        # Come back and flesh this out
        31.times do
          create(:trip)
        end

        visit trips_path

        expect(page).to have_content


      end
    end
  end
end
