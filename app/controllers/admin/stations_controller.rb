class Admin::StationsController < Admin::BaseController
  def new
    @station = Station.new()
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      flash[:success] = "Station #{@station.name} has been successfully created!"
      redirect_to station_path(@station)
    else
      flash[:failure] = "Your station was not saved. Please try again."
      render :new
    end
  end

  def edit
    @station = Station.find_by_slug(params[:slug])
  end

  def update
    @station = Station.find_by_slug(params[:slug])
    if @station.update(station_params)
      flash[:success] = "Your changes to #{@station.name} have been saved."
      redirect_to station_path(@station)
    else
      flash[:failure] = "Could not save changes."
      render :edit
    end
  end

  private
    def station_params
      params.require(:station).permit(:name, :dock_count, :city, :installation_date)
    end
end
