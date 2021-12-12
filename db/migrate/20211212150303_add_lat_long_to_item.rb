class AddLatLongToItem < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :latitude, :decimal
    add_column :items, :longitude, :decimal
  end
end
