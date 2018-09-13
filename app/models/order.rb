class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  def total_price
    order_items.map do |order_item|
      order_item.price * order_item.quantity
    end.sum
  end
end
