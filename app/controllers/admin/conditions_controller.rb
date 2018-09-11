class Admin::ConditionsController < Admin::BaseController

  def edit
    @condition = Condition.find(params[:id])
  end

  def update
    @condition = Condition.find(params[:id])
    if @condition.update(condition_params)
      flash[:success] = "You successfully edited a condition!"
      redirect_to trip_path(@condition)
    else
      flash[:failure] = "Invalid information, please fill out the form again."
      render :edit
    end
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
  

end
