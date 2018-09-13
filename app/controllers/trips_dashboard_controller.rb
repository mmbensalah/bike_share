class TripsDashboardController < ApplicationController
  before_action :require_user
  def index
    @average_duration = Trip.average_duration
    @longest_ride = Trip.longest_ride
    @shortest_ride = Trip.shortest_ride
    @most_rides_start = Trip.most_rides_start_station
    @most_rides_end = Trip.most_rides_end_station
    @most_ridden_bike = Trip.most_ridden_bike
    @least_ridden_bike = Trip.least_ridden_bike
    @date_with_highest_trips = Trip.date_with_most_trips
    @date_with_least_trips = Trip.date_with_least_trips
    @subscription_counts = Trip.subscription_counts
    @subscription_percents = Trip.subscription_percents
    @year_counts = Trip.rides_per_year(*Trip.get_years)
    require 'pry'; binding.pry
  end
end
