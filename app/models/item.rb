class Item < ApplicationRecord
  belongs_to :user
  belongs_to :condition
  has_many :item_genres
  has_many :genres, through: :item_genres
  has_many_attached :images
  has_many :trades

  validates :title, :author, presence: true

  scope :without_logged_user, ->(user_id) { where.not('user_id = ?', user_id) }

  def self.search(search = "", place = "", current_user_id = 0)
    items_of_others = without_logged_user(current_user_id)
    items_in_place = items_of_others.where('place like ?', "%#{place}%")
    items_in_place.where('title like ?', "%#{search}%").or(items_in_place.where('description like ?', "%#{search}%"))
  end
end
