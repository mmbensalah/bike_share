require 'rails_helper'

describe 'Trips Dashboard' do
  describe 'user can visit trips dashboard path' do
    it 'renders trips dashboard for user' do
      user = create(:user)
      10.times { create(:trip) }
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit trips_dashboard_path
      expect(page).to have_content("Average duration of ride: #{Trip.average_duration}")
      expect(page).to have_content("Longest ride: #{Trip.longest_ride}")
      expect(page).to have_content("Shortest ride: #{Trip.shortest_ride}")
      expect(page).to have_content("Station where most rides start: #{Trip.most_rides_start_station.keys[0]}")
      expect(page).to have_content("Station where most rides end: #{Trip.most_rides_end_station.keys[0]}")
      expect(page).to have_content("Most ridden bike: #{Trip.most_ridden_bike.keys[0]}")
      expect(page).to have_content("Least ridden bike: #{Trip.least_ridden_bike.keys[0]}")
      expect(page).to have_content("#{Trip.date_with_most_trips.values[0]}")
      expect(page).to have_content("#{Trip.date_with_most_trips.keys[0].strftime("%m/%d/%Y")}")
      expect(page).to have_content("#{Trip.date_with_least_trips.values[0]}")
      expect(page).to have_content("#{Trip.date_with_least_trips.keys[0].strftime("%m/%d/%Y")}")
      expect(page).to have_content("January trips: ")
      expect(page).to have_content("February trips: ")
      expect(page).to have_content("March trips: ")
      expect(page).to have_content("April trips: ")
      expect(page).to have_content("May trips: ")
      expect(page).to have_content("June trips: ")
      expect(page).to have_content("July trips: ")
      expect(page).to have_content("August trips: ")
      expect(page).to have_content("September trips: ")
      expect(page).to have_content("October trips: ")
      expect(page).to have_content("November trips: ")
      expect(page).to have_content("December trips: ")
      # add test for month by month breakdown
      # add test for user subscription breakdown
    end
  end
end
