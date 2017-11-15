class RenamePlaylistGenre < ActiveRecord::Migration[5.0]
  def change
    rename_column :date_cards, :playlist_genre, :playlist_id
  end
end
