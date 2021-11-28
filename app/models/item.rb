class Item < ApplicationRecord
  belongs_to :user
  belongs_to :condition
  has_many :item_genres
  has_many :genres, through: :item_genres
  has_one_attached :image
end
