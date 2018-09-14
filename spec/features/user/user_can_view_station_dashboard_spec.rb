require "rails_helper"

describe "As an authorized user" do
  describe "when I visit the welcome page" do
    it 'has a link for the station dashboard' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      click_on("Stations Dashboard")

      expect(current_path).to eq(stations_dashboard_path)
      expect(page).to have_content("Stations Dashboard")
    end
  end
end
