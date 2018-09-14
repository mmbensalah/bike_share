class OrdersController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    @order = Order.create(user_id: current_user.id)
    @cart.contents.each do |id, quantity|
      @order.order_items.create!(item_id: id, quantity: quantity, price: Item.find(id).price, title: Item.find(id).title)
    end
    if @order.save
      session[:cart] = nil

      flash[:message] = "Successfully submitted your order totaling $#{@order.total_price}0"
      redirect_to dashboard_path
    else
      flash[:message] = 'Something went wrong with your order. Try again.'
      redirect_to cart_path
    end
  end

  def show
    @order = Order.find(params[:id])
  end
end
