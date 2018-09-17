class UsersController < ApplicationController
  before_action :require_user, only: [:edit, :update]
  before_action :correct_user?, only: [:edit, :update]

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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your account was successfully updated."
      redirect_to dashboard_path
    else
      flash[:failure] = "Update failed, please try again."
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :address, :email, :username, :password, :password_confirmation)
    end
end
