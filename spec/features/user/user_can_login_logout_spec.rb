require 'rails_helper'

describe 'As a user' do
  it 'user can login' do

    visit root_path

    click_on "Log In"
    user = create(:user)

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    within ".login-form" do
      click_on "Log In"
    end

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Welcome #{user.username}")
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.email)

    within ".navbar" do
      expect(page).to have_content("Logged in as #{user.username}")
      expect(page).to have_content("Log Out")
      expect(page).to_not have_content("Log In")
      expect(page).to_not have_content("Create Account")
    end
  end
  it 'user can logout' do
    visit root_path

    click_on "Log In"
    user = create(:user)

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    within ".login-form" do
      click_on "Log In"
    end

    click_on "Log Out"

    expect(current_path).to eq root_path

    expect(page).to have_content("You have successfully logged out.")
    within ".navbar" do
      expect(page).to_not have_content("Logged in as #{user.username}")
      expect(page).to_not have_content("Log Out")
      expect(page).to have_content("Log In")
      expect(page).to have_content("Create Account")
    end
  end

  it 'should have links to dashboards' do
    user = create(:user)
    stations = create_list(:station, 5)
    trips = create_list(:trip, 5)
    condition = create(:condition, date: trips[0].start_date)
    condition = create(:condition, date: trips[1].start_date)
    condition = create(:condition, date: trips[2].start_date)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    click_on("Stations Dashboard")
    expect(current_path).to eq(stations_dashboard_path)

    visit root_path
    click_on("Trips Dashboard")
    expect(current_path).to eq(trips_dashboard_path)

    visit root_path
    click_on("Conditions Dashboard")
    expect(current_path).to eq(conditions_dashboard_path)
  end
end
