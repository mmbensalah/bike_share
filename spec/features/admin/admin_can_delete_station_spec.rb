require "rails_helper"

describe "As an admin" do
  describe "when I visit the stations index" do
    it 'should be able to delete a station' do
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
  end
end
