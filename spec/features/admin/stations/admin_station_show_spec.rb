require "rails_helper"

describe "As an admin" do
  describe "when I visit a station show" do
    it 'should have edit and delete buttons' do
      station = create(:station)
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit station_path(station)

      expect(page).to have_content("Edit")
      expect(page).to have_content("Delete")
    end
  end
end
