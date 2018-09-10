class CartsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    flash[:success] = "You have successfully added #{item.title} to your cart."
    redirect_to bike_shop_path
  end
end
