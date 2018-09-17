class Item < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  validates :price, :numericality => { :greater_than_or_equal_to => 0 },
            presence: true
  validates_presence_of :description
  validates_presence_of :status
  enum status: %w(active retired)
  has_many :order_items
  has_many :orders, through: :order_items
end
