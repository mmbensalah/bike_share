class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_admin?
  helper_method :current_user?
  before_action :set_cart

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def visitor?
    current_user == nil
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def current_user?
    current_user && current_user.default?
  end

  def require_user
    render file: "/public/404" unless current_user
  end

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end

  def correct_user?
    @user = User.find(params[:id])
    render file: "/public/404" unless @user == current_user
  end
end
