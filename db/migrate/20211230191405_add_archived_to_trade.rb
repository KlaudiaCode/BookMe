class AddArchivedToTrade < ActiveRecord::Migration[6.1]
  def change
    add_column :trades, :archived, :boolean, default: false
  end
end
