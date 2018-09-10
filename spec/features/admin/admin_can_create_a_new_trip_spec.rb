require 'rails_helper'

describe 'admin can create new trip' do
  describe 'on admin new trip page' do
    it 'fills in all trip attributes and can create a new trip, a flash message
        appears showing I succesfully created a trip' do
        admin = create(:user, role:1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)


        visit new_admin_trip_path

        fill_in :trip_duration, with: 500
        fill_in :trip_start_date, with: "09-15-1992"
        fill_in :trip_end_date, with: "10-31-2007"
        fill_in :trip_bike_id, with: 7
        fill_in :trip_subscription_type, with: "Subscriber"
        fill_in :trip_zip_code, with: 80220
        fill_in :trip_start_station_id, with: 1
        fill_in :trip_end_station_id, with: 2

        click_on "Create Trip"
        expect(Trip.all.count).to eq(1)

        trip = Trip.first
        expect(current_path).to eq admin_trip_path(trip)
        expect(page).to have_content("You successfully created a trip!")

    end
  end
end
