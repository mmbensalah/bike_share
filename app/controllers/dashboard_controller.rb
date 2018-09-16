class DashboardController < ApplicationController
  before_action :require_user

  def index
    @orders = Order.all
  end
end
