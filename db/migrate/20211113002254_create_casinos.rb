class CreateCasinos < ActiveRecord::Migration[6.1]
  def change
    create_table :casinos do |t|
      t.string :name
      t.string :address
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.boolean :active
      t.string :image

      t.timestamps
    end
  end
end
