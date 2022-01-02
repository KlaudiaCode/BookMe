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
#  place        :string
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
  has_many :item_genres, dependent: :destroy
  has_many :genres, through: :item_genres, dependent: :destroy
  has_many_attached :images
  has_many :sent_trades, class_name: 'Trade', foreign_key: 'trader_item_id'
  has_many :received_trades, class_name: 'Trade', foreign_key: 'owner_item_id'

  before_destroy :reject_trades

  validates :title, :author, :description, :publisher, presence: true
  validates :group, inclusion: { in: [true, false] }

  scope :without_logged_user, ->(user_id) { where.not('user_id = ?', user_id) }

  def self.search(search = '', place = '', filter = nil, current_user)
    id = current_user ? current_user.id : 0
    items_of_others = without_logged_user(id)
    if filter != nil
      items_of_others = items_of_others.where(group: filter)
    end
    items_in_place = items_of_others.where('place like ?', "%#{place}%")
    items_in_place.where('title like ?', "%#{search}%").or(items_in_place.where('description like ?', "%#{search}%"))
  end

  private

  def reject_trades
    sent_trades.each do |trade|
      trade.rejected!
    end
    received_trades.each do |trade|
      trade.rejected!
    end
  end
end
