class Admin::TripsController < Admin::BaseController

  def show
    @trip = Trip.find(params[:id])
  end

  def edit

  end

  def new
    @trip = Trip.new
  end

  def create

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
end
