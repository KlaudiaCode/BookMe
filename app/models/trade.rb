class Trade < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :trader, class_name: 'User'
  belongs_to :owner_item, class_name: 'Item'
  belongs_to :trader_item, class_name: 'Item'
end
