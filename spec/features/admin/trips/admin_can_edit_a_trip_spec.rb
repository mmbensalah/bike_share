require 'rails_helper'

describe 'admin can edit a trip' do
  describe 'on admin edit trip page' do
    it 'fills in all trip attributes and can edit a trip' do
        admin = create(:user, role:1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        trip = create(:trip)

        station_1 = create(:station)
        station_2 = create(:station)

        visit edit_admin_trip_path(trip)
        fill_in :trip_duration, with: 500
        fill_in :trip_start_date, with: "1992-04-01"
        fill_in :trip_end_date, with: "2007-09-15"
        fill_in :trip_bike_id, with: 7
        select(value = "Subscriber", from: 'trip[subscription_type]')
        fill_in :trip_zip_code, with: 80220
        select(value = station_1.name, from: 'trip[start_station_id]')
        select(value = station_2.name, from: 'trip[end_station_id]')

        click_on "Update Trip"

        expect(current_path).to eq trip_path(trip)
        expect(page).to have_content("You successfully edited a trip!")
        expect(page).to have_content("500")
    end
  end
  describe "User can't edit a  trip" do
    it "won't allow user to visit edit trip page" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      trip = create(:trip)
      visit edit_admin_trip_path(trip)

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
