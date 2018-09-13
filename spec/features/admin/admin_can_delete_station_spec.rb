require "rails_helper"

describe "As an admin" do
  describe "I want to delete a station" do
    it 'should be able to delete a station from the index' do
      admin = create(:user, role: 1)
      station_1 = create(:station)
      station_2 = create(:station)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit stations_path

      within("#station-#{station_1.id}") do
        click_on("Delete")
      end

      expect(page).to have_content("You have succesfully deleted Station #{station_1.name}.")
      within(".stations") do
        expect(page).to_not have_content(station_1.name)
      end
      expect(page).to have_content(station_2.name)
    end

    it 'should be able to delete a station from the show' do
      admin = create(:user, role: 1)
      station = create(:station)
      station_2 = create(:station)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit station_path(station)

      click_on("Delete Station")

      expect(page).to eq(stations_path)
      expect(page).to have_content("You have succesfully deleted Station #{station_1.name}.")
      within(".stations") do
        expect(page).to_not have_content(station.name)
        expect(page).to have_content(station_2.name)
      end
    end 
  end
end
