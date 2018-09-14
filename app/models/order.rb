class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  enum status: %w(cancelled ordered paid completed)
  include ActionView::Helpers::NumberHelper
  def total_price
    number_to_currency(order_items.map do |order_item|
      order_item.price * order_item.quantity
    end.sum)
  end
end
