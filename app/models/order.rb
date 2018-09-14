class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  include ActionView::Helpers::NumberHelper


  def total_price
    number_to_currency(order_items.map do |order_item|
      order_item.price * order_item.quantity
    end.sum)
  end

  def helpers
  ActionController::Base.helpers
  end

end
