require 'rails_helper'

describe 'admin can create new trip' do
  describe 'on admin new trip page' do
    it 'fills in all trip attributes and can create a new trip, a flash message
        appears showing I succesfully created a trip' do
        admin = create(:user, role:1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
        station_1 = create(:station)
        station_2 = create(:station)

        visit new_admin_trip_path
        fill_in :trip_duration, with: 500
        fill_in :trip_start_date, with: "1992-04-01"
        fill_in :trip_end_date, with: "2007-09-15"
        fill_in :trip_bike_id, with: 7
        fill_in :trip_subscription_type, with: "Subscriber"
        fill_in :trip_zip_code, with: 80220
        select(value = station_1.name, from: 'trip[start_station_id]')
        select(value = station_2.name, from: 'trip[end_station_id]')

        click_on "Create Trip"
        expect(Trip.all.count).to eq(1)

        trip = Trip.first
        expect(current_path).to eq admin_trip_path(trip)
        expect(page).to have_content("You successfully created a trip!")
    end
  end
  describe "User can't create a new trip" do
    it "won't allow user to visit new trip page" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_admin_trip_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
