require "rails_helper"


describe "As an admin" do
  describe "when I visit the stations index" do
    it 'should have edit and delete buttons' do
      station_1 = create(:station)
      station_2 = create(:station)
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit stations_path

      within("#station-#{station_1.id}") do
        expect(page).to have_content(station_1.name)
        expect(page).to have_content("Edit")
        expect(page).to have_content("Delete")
      end

      within("#station-#{station_2.id}") do
        expect(page).to have_content(station_1.name)
        expect(page).to have_content("Edit")
        expect(page).to have_content("Delete")
      end
    end
  end
end
