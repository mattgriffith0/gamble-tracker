class AddNumberToCasinos < ActiveRecord::Migration[6.1]
  def change
    add_column :casinos, :street_number, :string
  end
end
