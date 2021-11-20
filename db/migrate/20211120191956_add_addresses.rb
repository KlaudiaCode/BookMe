class AddAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :city, null: false
      t.string :street, null: false
      t.string :street_num
      t.integer :num, null: false
      t.string :zip_code, null: false
      t.timestamps
    end
  end
end
