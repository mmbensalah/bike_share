class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if current_user.admin?
        redirect_to admin_dashboard_path
      else
        redirect_to dashboard_path
      end
    else
      flash[:failure] = "Incorrect credentials. Please try again."
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "You have successfully logged out."
    redirect_to root_path
  end
end
