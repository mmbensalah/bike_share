class OrderItem < ApplicationRecord
  validates_presence_of :price
  belongs_to :order
  belongs_to :item
end
