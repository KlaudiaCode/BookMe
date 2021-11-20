class UpdateItemModel < ActiveRecord::Migration[6.1]
  def change
    change_table :items do |t|
      t.string :description, null: false
      t.string :author, null: false
      t.boolean :group
      t.string :publisher, null: false
      t.integer :player_min
      t.integer :player_max
      t.boolean :tradable

      t.belongs_to :user
      t.belongs_to :condition
    end
  end
end
