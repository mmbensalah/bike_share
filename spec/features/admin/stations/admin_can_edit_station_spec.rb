require "rails_helper"

describe "As an admin" do
  describe "when I click on Edit for Station" do
    it "should edit the station" do
      station = create(:station)
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit stations_path

      within("#station-#{station.id}") do
        click_on("Edit")
      end

      expect(current_path).to eq(edit_admin_station_path(station))

      dock_count = 30
      city = "Daly City"
      date = "2018-09-15"

      fill_in :station_dock_count, with: dock_count
      fill_in :station_city, with: city
      fill_in :station_installation_date, with: date
      click_on("Update Station")

      expect(current_path).to eq(station_path(station))

      expect(page).to have_content(station.name)
      expect(page).to have_content("Dock Count: #{dock_count}")
      expect(page).to have_content(city)
      expect(page).to have_content("Installation Date: #{date}")
      expect(page).to_not have_content("Dock Count: #{station.dock_count}")
      expect(page).to_not have_content(station.city)
      expect(page).to_not have_content(station.installation_date)
    end
  end
end