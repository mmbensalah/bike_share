class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  enum status: %w(cancelled ordered paid completed)
  include ActionView::Helpers::NumberHelper

  def self.status_total
    group(:status).count(:id)
  end

  def self.filter_status(filter)
    where(status: filter)
  end

  def total_price
    number_to_currency(order_items.map do |order_item|
      order_item.price * order_item.quantity
    end.sum)
  end
end
