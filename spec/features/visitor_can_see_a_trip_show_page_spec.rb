require 'rails_helper'

describe 'a visitor can see a single trip' do
  context 'on its show page' do
    it 'shows a single trip and all of its attributes' do
      trip = create(:trip)

      visit trip_path(trip)

      expect(page).to have_content(trip.duration)
      expect(page).to have_content(trip.start_date)
      expect(page).to have_content(trip.end_date)
      expect(page).to have_content(trip.zip_code)
      expect(page).to have_content(trip.bike_id)
      expect(page).to have_content(trip.start_station_id)
      expect(page).to have_content(trip.end_station_id)
      expect(page).to have_content(trip.subscription_type)
    end
  end
end
