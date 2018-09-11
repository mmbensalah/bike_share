class Admin::ConditionsController < Admin::BaseController

  def edit

  end

  def destroy
    @condition = Condition.find(params[:id])
    if @condition.destroy
      flash[:success] = "Condition successfully destroyed!"
      redirect_to conditions_path
    else
      flash[:failure] = "Something went wrong, condition could not be destroyed."
      redirect_to condition_path(@condition)
    end
  end

  def new
    @condition = Condition.new
  end

  def create
    @condition = Condition.create(condition_params)
    if @condition.save
      flash[:success] = "You successfully created a condition!"
      redirect_to condition_path(@condition)
    else
      flash[:failure] = "Invalid information, please fill out the form again."
      render :new
    end
  end

  private
    def condition_params
      params.require(:condition).permit(:date,
                                        :max_temperature,
                                        :min_temperature,
                                        :mean_temperature,
                                        :mean_humidity,
                                        :mean_visibility,
                                        :mean_wind_speed,
                                        :precipitation
                                        )
    end

end
