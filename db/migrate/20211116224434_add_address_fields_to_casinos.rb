class AddAddressFieldsToCasinos < ActiveRecord::Migration[6.1]
  def change
    add_column :casinos, :street, :string
    add_column :casinos, :city, :string
    add_column :casinos, :state, :string
    add_column :casinos, :postcode, :string
    add_column :casinos, :country, :string
  end
end
