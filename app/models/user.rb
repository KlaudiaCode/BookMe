class User < ApplicationRecord
  has_many :items
  has_one :address
  has_secure_password
end
