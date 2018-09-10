require 'rails_helper'

describe 'admin visits a trip show page' do
  describe 'sees everything a user can see' do
    it 'can also see a button to edit a trip' do
      admin = create(:user, role:1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      trip = create(:trip)

      visit admin_trip_path(trip)

      click_on "Edit Trip"

      expect(current_path).to eq edit_admin_trip_path(trip)
    end
    it 'can also see a button to delete a trip' do
      admin = create(:user, role:1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      trip = create(:trip)

      visit admin_trip_path(trip)

      click_on "Delete Trip"

      expect(Trip.all.count).to eq(0)
    end
  end
  describe 'as a user' do
    it 'does not allow user to see admin trip show page' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      trip = create(:trip)

      visit admin_trip_path(trip)

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
