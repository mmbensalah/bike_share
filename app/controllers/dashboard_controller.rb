class DashboardController < ApplicationController
  before_action :require_user

  def index
  end

  def require_user
    render file: "/public/404" unless current_user?
    @orders = Order.all
  end
end
