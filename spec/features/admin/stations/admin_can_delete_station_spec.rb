require "rails_helper"

describe "As an admin" do
  describe "I want to delete a station" do
    it 'should be able to delete a station from the index' do
      admin = create(:user, role: 1)
      station_1 = create(:station)
      station_1.start_trips.create(duration: 71, start_date: "2013-08-29", end_date: "2013-08-29", bike_id: 48, subscription_type: "Subscriber", zip_code: 97214, start_station_id: 1, end_station_id: 1)

      station_2 = create(:station)
      station_2.start_trips.create(duration: 71, start_date: "2013-08-29", end_date: "2013-08-29", bike_id: 48, subscription_type: "Subscriber", zip_code: 97214, start_station_id: 2, end_station_id: 1)

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
      station.start_trips.create(duration: 71, start_date: "2013-08-29", end_date: "2013-08-29", bike_id: 48, subscription_type: "Subscriber", zip_code: 97214, start_station_id: 1, end_station_id: 1)

      station_2 = create(:station)
      station_2.start_trips.create(duration: 71, start_date: "2013-08-29", end_date: "2013-08-29", bike_id: 48, subscription_type: "Subscriber", zip_code: 97214, start_station_id: 2, end_station_id: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit station_path(station)

      click_on("Delete")

      expect(current_path).to eq(stations_path)
      expect(page).to have_content("You have succesfully deleted Station #{station.name}.")
      within(".stations") do
        expect(page).to_not have_content(station.name)
        expect(page).to have_content(station_2.name)
      end
    end
  end
end
