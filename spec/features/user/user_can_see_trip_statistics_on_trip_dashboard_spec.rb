require 'rails_helper'

describe 'Trips Dashboard' do
  describe 'user can visit trips dashboard path' do
    it 'renders trips dashboard for user' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit trips_dashboard_path

      expect(page).to have_content("Average Duration of Ride: #{Trip.average_duration}")
      expect(page).to have_content("Longest Ride: #{Trip.longest_ride}")
      expect(page).to have_content("Shortest Ride: #{Trip.shortest_ride}")
      expect(page).to have_content("Station where most rides start: #{Trip.most_rides_starting_station}")
      expect(page).to have_content("Station where most rides end: #{Trip.most_rides_ending_station}")
      expect(page).to have_content("Most ridden bike: #{Trip.most_ridden_bike}")
      expect(page).to have_content("Least ridden bike: #{Trip.least_ridden_bike}")
      expect(page).to have_content("Date with highest number of trips: #{Trip.least_ridden_bike}")
      expect(page).to have_content("Date with lowest number of trips: #{Trip.least_ridden_bike}")
      # add test for month by month breakdown
      # add test for user subscription breakdown
    end
