class AddCasinoToGames < ActiveRecord::Migration[6.1]
  def change
    add_reference :games, :casino, null: false, foreign_key: true
  end
end
