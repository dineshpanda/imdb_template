class AddAddressFormattedAddressToDirector < ActiveRecord::Migration[6.0]
  def change
    add_column :directors, :address_formatted_address, :string
  end
end
