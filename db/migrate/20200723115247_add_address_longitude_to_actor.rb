class AddAddressLongitudeToActor < ActiveRecord::Migration[6.0]
  def change
    add_column :actors, :address_longitude, :float
  end
end
