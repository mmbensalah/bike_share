require 'rails_helper'

describe 'Trips Dashboard' do
  describe 'user can visit trips dashboard path' do
    it 'renders trips dashboard for user' do
      user = create(:user)
      5.times { create(:trip, subscription_type: "Customer") }
      5.times { create(:trip, subscription_type: "Subscriber") }
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit trips_dashboard_path
      expect(page).to have_content("Average duration of ride: #{Trip.average_duration}")
      expect(page).to have_content("Longest ride: #{Trip.longest_ride.duration}")
      expect(page).to have_content("Shortest ride: #{Trip.shortest_ride.duration}")
      expect(page).to have_content("Station where most rides start: #{Trip.most_rides_start_station.name}")
      expect(page).to have_content("Station where most rides end: #{Trip.most_rides_end_station.name}")
      expect(page).to have_content("#{Trip.most_ridden_bike[:bike]}")
      expect(page).to have_content("#{Trip.least_ridden_bike[:bike]}")
      expect(page).to have_content("#{Trip.date_with_most_trips[:date]}")
      expect(page).to have_content("#{Trip.date_with_most_trips[:date]}")
      expect(page).to have_content("#{Trip.date_with_least_trips[:date]}")
      expect(page).to have_content("#{Trip.date_with_least_trips[:date]}")
      # expect(page).to have_content("January trips: ")
      # expect(page).to have_content("February trips: ")
      # expect(page).to have_content("March trips: ")
      # expect(page).to have_content("April trips: ")
      # expect(page).to have_content("May trips: ")
      # expect(page).to have_content("June trips: ")
      # expect(page).to have_content("July trips: ")
      # expect(page).to have_content("August trips: ")
      # expect(page).to have_content("September trips: ")
      # expect(page).to have_content("October trips: ")
      # expect(page).to have_content("November trips: ")
      # expect(page).to have_content("December trips: ")
      # add test for month by month breakdown
      expect(page).to have_content(Trip.rides_per_year(*Trip.get_years).map {|pair| pair.values}.flatten.first)
      subscribe_counts = Trip.subscription_counts
      expect(page).to have_content(subscribe_counts["Subscriber"])
      expect(page).to have_content(subscribe_counts["Customer"])
      subscribe_percents = Trip.subscription_percents
      expect(page).to have_content(subscribe_percents["Subscriber"])
      expect(page).to have_content(subscribe_percents["Customer"])
      save_and_open_page
    end
  end
end
