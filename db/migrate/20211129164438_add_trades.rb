class AddTrades < ActiveRecord::Migration[6.1]
  def change
    create_table :trades do |t|
      t.integer :status, default: 0
      t.belongs_to :owner
      t.belongs_to :trader
      t.belongs_to :trader_item
      t.belongs_to :owner_item
      t.timestamps
    end
  end
end
