class RemoveFieldsFromGames < ActiveRecord::Migration[6.1]
  def change
    remove_column :games, :odds, :string
    remove_column :games, :currency, :string
  end
end
