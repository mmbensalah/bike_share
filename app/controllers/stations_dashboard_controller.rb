class StationsDashboardController < ApplicationController
  before_action :require_user

  def index
    @total_stations = Station.total_stations
    @average_bikes = Station.avg_number_bikes
    @most_bikes_stations = Station.most_bikes
    @least_bikes_stations = Station.least_bikes
    @recent_station = Station.newest
    @oldest_station = Station.oldest
  end
end
