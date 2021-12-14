class AddPlaceToItem < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :place, :string
  end
end
