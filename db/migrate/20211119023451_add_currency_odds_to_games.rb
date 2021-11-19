class AddCurrencyOddsToGames < ActiveRecord::Migration[6.1]
  def change
    add_reference :games, :odds, null: false, foreign_key: true
    add_reference :games, :currency, null: false, foreign_key: true
  end
end
