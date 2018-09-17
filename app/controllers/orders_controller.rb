class OrdersController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    if visitor?
      flash[:message] = "Please log in to checkout."
      redirect_to login_path
    else
      @order = Order.create(user_id: current_user.id)
      @cart.contents.each do |id, quantity|
        @order.order_items.create(item_id: id, quantity: quantity, price: Item.find(id).price, title: Item.find(id).title)
      end
      if @order.save
        session[:cart] = nil

        flash[:message] = "Successfully submitted your order totaling #{@order.total_price}"
        redirect_to dashboard_path
      else
        flash[:message] = 'Something went wrong with your order. Try again.'
        redirect_to cart_path
      end
    end
  end

  def show
    @order = Order.find(params[:id])
    if current_user != @order.user
      render file: "/public/404" unless current_admin?
    end
  end
end
