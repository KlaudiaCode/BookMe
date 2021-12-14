# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  author       :string           not null
#  description  :string           not null
#  group        :boolean
#  latitude     :decimal(, )
#  longitude    :decimal(, )
#  player_max   :integer
#  player_min   :integer
#  publisher    :string           not null
#  title        :string
#  tradable     :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  condition_id :integer
#  user_id      :integer
#
# Indexes
#
#  index_items_on_condition_id  (condition_id)
#  index_items_on_user_id       (user_id)
#
class Item < ApplicationRecord
  belongs_to :user
  belongs_to :condition
  has_many :item_genres
  has_many :genres, through: :item_genres
  has_many_attached :images
  has_many :trades, dependent: :destroy

  validates :title, :author, :description, :publisher, presence: true

  scope :without_logged_user, ->(user_id) { where.not('user_id = ?', user_id) }

  def self.search(search = "", place = "", current_user_id = 0)
    items_of_others = without_logged_user(current_user_id)
    items_in_place = items_of_others.where('place like ?', "%#{place}%")
    items_in_place.where('title like ?', "%#{search}%").or(items_in_place.where('description like ?', "%#{search}%"))
  end
end
