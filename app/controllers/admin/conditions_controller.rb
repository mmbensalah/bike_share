class Admin::ConditionsController < Admin::BaseController

  def index
    @conditions = Condition.all
  end

  def edit

  end

  def destroy
    @condition = Condition.find(params[:id])
    if @condition.destroy
      flash[:success] = "Condition successfully destroyed!"
      redirect_to admin_conditions_path
    else
      flash[:failure] = "Something went wrong, condition could not be destroyed."
      redirect_to admin_condition_path(@condition)
    end
  end
end
