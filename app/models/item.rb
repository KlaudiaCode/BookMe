class Item < ApplicationRecord
  belongs_to :user
  belongs_to :condition
  has_many :item_genres
  has_many :genres, through: :item_genres
  has_one_attached :image
  has_many :trades

  validates :title, :author, presence: true

  scope :without_logged_user, ->(user_id) { where.not('user_id = ?', user_id) }

  def self.search(search = nil, current_user_id = 0)
    items_of_others = without_logged_user(current_user_id)
    if search
      items_of_others.where('title like ?', "%#{search}%")
         .or(items_of_others.where('description like ?', "%#{search}%"))
    else
      items_of_others
    end
  end
end
