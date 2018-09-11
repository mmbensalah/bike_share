class Admin::TripsController < Admin::BaseController

  def edit
    @trip = Trip.find(params[:id])
    @stations = Station.all
  end

  def new
    @trip = Trip.new
    @stations = Station.all
  end

  def create
    @trip = Trip.create!(trip_params)
    if @trip.save
      flash[:success] = "You successfully created a trip!"
      redirect_to trip_path(@trip)
    else
      flash[:failure] = "Invalid information, please fill out the form again."
      render :new
    end
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      flash[:success] = "You successfully edited a trip!"
      redirect_to trip_path(@trip)
    else
      flash[:failure] = "Invalid information, please fill out the form again."
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    if @trip.destroy
      flash[:success] = "Trip successfully destroyed!"
      redirect_to trips_path
    else
      flash[:failure] = "Something went wrong, trip could not be destroyed."
      redirect_to trip_path(@trip)
    end
  end

  private
    def trip_params
      params.require(:trip).permit(:duration,
                                   :start_date,
                                   :end_date,
                                   :bike_id,
                                   :subscription_type,
                                   :zip_code,
                                   :start_station_id,
                                   :end_station_id)
    end
end
