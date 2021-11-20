class AddConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :conditions do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
