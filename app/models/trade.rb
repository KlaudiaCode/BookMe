# == Schema Information
#
# Table name: trades
#
#  id             :integer          not null, primary key
#  archived       :boolean          default(FALSE)
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
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :trader, class_name: 'User', foreign_key: "trader_id"
  belongs_to :owner_item, class_name: 'Item', foreign_key: "owner_item_id"
  belongs_to :trader_item, class_name: 'Item', foreign_key: "trader_item_id"
  enum status: %i[pending seen accepted rejected]

  validates :status, presence: true
end
