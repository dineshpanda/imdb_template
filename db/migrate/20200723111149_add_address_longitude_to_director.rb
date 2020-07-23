class AddAddressLongitudeToDirector < ActiveRecord::Migration[6.0]
  def change
    add_column :directors, :address_longitude, :float
  end
end
