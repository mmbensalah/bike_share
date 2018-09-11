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

end
