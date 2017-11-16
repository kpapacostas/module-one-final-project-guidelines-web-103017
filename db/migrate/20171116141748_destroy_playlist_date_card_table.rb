class DestroyPlaylistDateCardTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :playlist_date_cards
  end
end
