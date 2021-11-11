class UpdateItemModel < ActiveRecord::Migration[6.1]
  def change
    change_table :items do |t|
      t.string :description
      t.string :author
      t.boolean :type
    end
  end
end
