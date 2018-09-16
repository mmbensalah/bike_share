class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :address
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, allow_nil: true
  validates_confirmation_of :password
  enum role: %w(default admin)
  has_secure_password
  has_many :orders
end
