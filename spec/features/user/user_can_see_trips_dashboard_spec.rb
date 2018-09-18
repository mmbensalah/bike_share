require 'rails_helper'

describe 'Trips Dashboard' do
  describe 'user can visit trips dashboard path' do
    it 'renders trips dashboard for user' do
      user = create(:user)
      create(:trip)
      create(:trip)
      create(:condition, date: Trip.first.start_date)
      create(:condition, date: Trip.last.start_date)
      create(:condition, date: Trip.last.start_date)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit trips_dashboard_path

      expect(page).to have_content('Trips Dashboard')
    end
    it 'does not allow visitor to see trips dashboard' do
      visit trips_dashboard_path
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
