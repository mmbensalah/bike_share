class User < ApplicationRecord
  validates_presence_of :first_name, :last_name
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_confirmation_of :password
  enum role: %w(default admin)
  has_secure_password
end
