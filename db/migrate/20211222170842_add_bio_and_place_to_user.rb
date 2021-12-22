class AddBioAndPlaceToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :bio, :string
    add_column :users, :place, :string
    add_column :users, :latitude, :decimal
    add_column :users, :longitude, :decimal
  end
end
