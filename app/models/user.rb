class User < ApplicationRecord
  has_many :items
  has_one :address
end
