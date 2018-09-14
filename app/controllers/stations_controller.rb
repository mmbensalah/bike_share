class StationsController < ApplicationController

  def index
    @stations = Station.all
  end

  def show
    @station = Station.find_by(slug: params[:slug])
    @show_data = @station.show_data if @station.start_trips.first && @station.end_trips.first
  end
end
