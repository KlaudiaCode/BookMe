class AddGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :name, null: false
      t.boolean :group
      t.timestamps
    end
  end
end