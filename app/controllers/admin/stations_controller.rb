class Admin::StationsController < Admin::BaseController
  def edit
    @station = Station.find_by_slug(params[:id])
  end

  def update
    @station = Station.find_by_slug(params[:id])
    if @station.update(station_params)
      flash[:success] = "Your changes to #{@station.name} have been saved."
      redirect_to station_path(@station)
    else
      flash[:error] = "Could not save changes."
      render :edit
    end
  end

  def destroy
    @station = Station.find_by_slug(params[:slug])
    if @station.destroy
      flash[:success] = "You have succesfully deleted Station #{@station.name}."
    else
      flash[:failure] = "Station #{@station.name} could not be deleted."
    end
    redirect_to stations_path
  end

  private
    def station_params
      params.require(:station).permit(:name, :dock_count, :city, :installation_date)
    end
end
