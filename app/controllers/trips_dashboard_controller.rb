class TripsDashboardController < ApplicationController
  before_action :require_user
  def index
    @average_duration = Trip.average_duration
    @longest_ride = Trip.longest_ride
    @shortest_ride = Trip.shortest_ride
    @most_rides_start_hash = Trip.most_rides_start_station
    @most_rides_start = @most_rides_start_hash.keys[0]
    @most_rides_end_hash = Trip.most_rides_end_station
    @most_rides_end = @most_rides_end_hash.keys[0]
    @most_ridden_bike = Trip.most_ridden_bike.keys[0]
    @least_ridden_bike = Trip.least_ridden_bike.keys[0]
    @date_with_highest_trips = Trip.date_with_most_trips
    @date_with_least_trips = Trip.date_with_least_trips
  end
end
