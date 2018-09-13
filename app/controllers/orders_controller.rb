class OrdersController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    order = Order.create!(user_id: current_user.id)
    @cart.find_items.each do |item|
      order.order_items.create(item_id: item.id, price: item.price)
    end
    if order.save
      session[:cart] = nil
      flash[:message] = 'Successfully submitted your order totaling'
      redirect_to dashboard_path
    else
      flash[:message] = 'Something went wrong with your order. Try again.'
      redirect_to cart_path
    end
  end
end

# Game.create(user_name: "Rachel") do |game|
#   @backpack.each do |pokemon_id, quantity|
#     game.captures.create(pokemon_id: pokemon_id, quantity: quantity)
#   end
# end
# @cart.contents.each do |item_id, quantity|
#   order.order_items.new(item_id: item_id, quantity: quantity)
# end
