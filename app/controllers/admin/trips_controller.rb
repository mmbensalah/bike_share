class Admin::TripsController < Admin::BaseController

  def show
    @trip = Trip.find(params[:id])
  end

  def edit

  end

  def new
    @trip = Trip.new
    @stations = Station.all
  end

  def create
    @trip = Trip.create!(trip_params)
    if @trip.save
      flash[:success] = "You successfully created a trip!"
      redirect_to admin_trip_path(@trip)
    else
      flash[:failure] = "Invalid information, please fill out the form again."
      render :new
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    if @trip.destroy
      flash[:success] = "Trip succesfully destroyed"
    else
      flash[:failure] = "Something went wrong, trip could not be destroyed."
      redirect_to admin_trip_path(@trip)
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
