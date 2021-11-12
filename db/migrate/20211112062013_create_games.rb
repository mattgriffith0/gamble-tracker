class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.references :user, null: false, foreign_key: true
      t.references :trip, foreign_key: true
      t.date :date
      t.integer :buy_in
      t.integer :cash_out

      t.timestamps
    end
  end
end
