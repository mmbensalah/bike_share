class DashboardController < ApplicationController
  before_action :require_user

  def index
    @orders = Order.where(user_id: current_user.id)
  end
end
