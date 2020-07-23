class AddAddressLatitudeToActor < ActiveRecord::Migration[6.0]
  def change
    add_column :actors, :address_latitude, :float
  end
end
