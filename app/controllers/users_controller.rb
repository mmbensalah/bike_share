class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "Your account was succesfully created."
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash[:failure] = "Something went wrong. Please try again."
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :address, :email, :username, :password, :password_confirmation)
    end
end
