require "rails_helper"

describe "As a visitor" do
  it "should not allow access to stations dashboard" do
    visit root_path

    expect(page).to_not have_content("Stations Dashboard")

    visit stations_dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end

describe "As an authorized user" do
  before(:each) do
    @user = create(:user)
    @station_1 = Station.create!(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "2013-08-20")
    @station_2 = Station.create!(name: "Castro Station", dock_count: 25, city: "San Francisco", installation_date: "2013-08-16")
    @station_3 = Station.create!(name: "SFSU", dock_count: 26, city: "Daly City", installation_date: "2013-09-01")
    @station_4 = Station.create!(name: "City Station", dock_count: 26, city: "San Fran City", installation_date: "2013-08-30")
    @station_5 = Station.create!(name: "San Jose Main", dock_count: 25, city: "San Jose", installation_date: "2013-08-30")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit stations_dashboard_path
  end
  describe "when I visit the welcome page" do
    it 'has a link for the station dashboard' do
      visit root_path
      click_on("Stations Dashboard")

      expect(current_path).to eq(stations_dashboard_path)
      expect(page).to have_content("Stations Dashboard")
    end

    it 'should show station analytics' do
      expect(page).to have_content("Total Number of Stations: #{Station.count}")
      expect(page).to have_content("Average bikes available per station: #{Station.average(:dock_count)}")
      expect(page).to have_content("Most bikes available: #{@station_1.dock_count} at station: #{@station_1.name}")
      expect(page).to have_content("Fewest bikes available: #{@station_5.dock_count} at stations: #{@station_2.name}, #{@station_5.name}")
      expect(page).to have_content("Most recently installed station: #{@station_3.name} installed on #{@station_3.installation_date}")
      expect(page).to have_content("Oldest station: #{@station_2.name} installed on #{@station_2.installation_date}")
    end
  end
end
