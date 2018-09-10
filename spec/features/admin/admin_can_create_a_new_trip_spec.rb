require 'rails_helper'

describe 'admin can create new trip' do
  describe 'on admin new trip page' do
    it 'fills in all trip attributes and can create a new trip, a flash message
        appears showing I succesfully created a trip' do
        admin = create(:user, role:1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)


        visit new_admin_trip_path

        fill_in :trip_date
        fill_in :trip_max_temperature
        fill_in :trip_min_temperature
        fill_in :trip_mean_temperature
        fill_in :trip_mean_humidity
        fill_in :trip_mean_visibility
        fill_in :trip_mean_wind_speed
        fill_in :trip_precipitation

        click_on "Create Trip"
        expect(Trip.all.count).to eq(1)

        trip = Trip.first
        expect(current_path).to eq admin_trip_path(trip)
        expect(page).to have_content("You successfully created a trip!")

    end
  end
end
