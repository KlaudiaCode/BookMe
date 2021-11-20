class AddUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.string :username, null: false
      t.integer :phone
      t.string :email, null: false
      t.string :password_digest
      t.boolean :is_admin
      t.timestamps
    end
  end
end
