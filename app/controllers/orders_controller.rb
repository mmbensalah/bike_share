class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    flash[:message] = "Successfully submitted your order totaling"
    redirect_to dashboard_path
  end
end
