require 'rails_helper'

describe 'visitor can see a station show page' do
  it 'displays a stations attributes' do
    station = create(:station)
    station.start_trips.create(duration: 71, start_date: "2013-08-29", end_date: "2013-08-29", bike_id: 48, subscription_type: "Subscriber", zip_code: 97214, start_station_id: 1, end_station_id: 1)

    visit station_path(station)
    expect(current_path).to eq("/stations/#{station.slug}")

    expect(page).to have_content(station.name)
    expect(page).to have_content(station.dock_count)
    expect(page).to have_content(station.city)
    expect(page).to have_content(station.installation_date)
    expect(page).to_not have_content("Edit")
    expect(page).to_not have_content("Delete")
  end
end
