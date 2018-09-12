require "rails_helper"

describe "As an admin" do
  describe "when I visit stations index" do
    it 'can create a new station' do
      admin = create(:user, role:1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit stations_path

      click_on("Create New Station")

      expect(current_path).to eq(new_admin_station_path)

      name = "New Station Name"
      dock_count = 30
      city = "Daly City"
      date = "2018-09-15"

      fill_in :station_name, with: name
      fill_in :station_dock_count, with: dock_count
      fill_in :station_city, with: city
      fill_in :station_installation_date, with: date
      click_on("Create Station")

      expect(current_path).to eq(station_path(Station.last))
      expect(page).to have_content("Station #{name} has been successfully created!")
      expect(page).to have_content("Dock Count: #{dock_count}")
      expect(page).to have_content(city)
      expect(page).to have_content("Installation Date: #{date}")
    end
  end
end
