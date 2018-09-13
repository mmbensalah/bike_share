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

  private
    def station_params
      params.require(:station).permit(:name, :dock_count, :city, :installation_date)
    end
end
