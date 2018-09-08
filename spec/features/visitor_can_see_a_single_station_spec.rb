require 'rails_helper'

describe 'visitor can see a station show page' do
  it 'displays a stations attributes' do
    station = create(:station)

    visit station_path(station.slug)
    expect(current_path).to eq("/station/#{station.slug}")

    expect(page).to have_content(station.name)
    expect(page).to have_content(station.dock_count)
    expect(page).to have_content(station.city)
    expect(page).to have_content(station.installation_date)

  end
end
