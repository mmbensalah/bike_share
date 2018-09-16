class DashboardController < ApplicationController
  before_action :require_user

  def index
<<<<<<< HEAD
  end

  def require_user
    render file: "/public/404" unless current_user?
=======
    @orders = Order.all
>>>>>>> 160dc1489bd457edd39477490c7290b8eda89dd8
  end
end
