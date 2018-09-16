class CartsController < ApplicationController
  def index
    @cart_items = @cart.find_items
  end

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:success] = "You have successfully added #{item.title} to your cart."

    redirect_to bike_shop_path
  end

  def destroy
    item = Item.find(params[:id])
    @cart.remove_item(item.id)
    session[:cart] = @cart.contents
    flash[:success] = "#{view_context.link_to item.title, item_path(item)} removed from cart."
    redirect_to carts_path
  end
end
