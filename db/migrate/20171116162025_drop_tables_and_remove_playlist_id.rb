class DropTablesAndRemovePlaylistId < ActiveRecord::Migration[5.0]
  def change
    remove_column :date_cards, :playlist_id
    drop_table :drink_date_cards
    drop_table :recipe_date_cards
  end
end
