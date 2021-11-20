class Genre < ApplicationRecord
  has_many :item_genres
  has_many :items, through: :item_genres
end
