class CreateItemGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :item_genres do |t|
      t.belongs_to :item
      t.belongs_to :genre
      t.timestamps
    end
  end
end
