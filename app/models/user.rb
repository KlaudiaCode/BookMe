class User < ApplicationRecord
  has_many :items
  has_one :address
  has_secure_password
  has_many :trades

  validates :name, :surname, :email, presence: true
end
