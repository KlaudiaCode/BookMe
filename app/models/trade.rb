# == Schema Information
#
# Table name: trades
#
#  id             :integer          not null, primary key
#  status         :integer          default("pending")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#  owner_item_id  :integer
#  trader_id      :integer
#  trader_item_id :integer
#
# Indexes
#
#  index_trades_on_owner_id        (owner_id)
#  index_trades_on_owner_item_id   (owner_item_id)
#  index_trades_on_trader_id       (trader_id)
#  index_trades_on_trader_item_id  (trader_item_id)
#
class Trade < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :trader, class_name: 'User'
  belongs_to :owner_item, class_name: 'Item'
  belongs_to :trader_item, class_name: 'Item'
  enum status: %i[pending seen accepted rejected]

  validates :status, presence: true
end
