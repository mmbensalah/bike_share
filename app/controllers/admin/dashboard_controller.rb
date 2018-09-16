class Admin::DashboardController < Admin::BaseController
  def index
    @orders = Order.all
    @status = Order.status_total
  end
end
