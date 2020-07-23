class AddAddressFormattedAddressToActor < ActiveRecord::Migration[6.0]
  def change
    add_column :actors, :address_formatted_address, :string
  end
end
