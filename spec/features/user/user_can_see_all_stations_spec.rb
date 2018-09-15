require 'rails_helper'

describe 'visitor can see all stations' do
  context 'on the stations index page' do
    it 'shows all stations listing their name, dock count, city, and installation date' do
      station_1 = create(:station)
      station_2 = create(:station)
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit stations_path

      expect(page).to have_content(station_1.name)
      expect(page).to have_content(station_1.dock_count)
      expect(page).to have_content(station_1.city)
      expect(page).to have_content(station_1.installation_date)

      expect(page).to have_content(station_2.name)
      expect(page).to have_content(station_2.dock_count)
      expect(page).to have_content(station_2.city)
      expect(page).to have_content(station_2.installation_date)
    end

    it 'should not see edit and delete options' do
      station_1 = create(:station)
      station_2 = create(:station)
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit stations_path

      within("#station-#{station_1.id}") do
        expect(page).to_not have_content("Edit")
        expect(page).to_not have_content("Delete")
      end

      within("#station-#{station_2.id}") do
        expect(page).to_not have_content("Edit")
        expect(page).to_not have_content("Delete")
      end
    end
  end
end
