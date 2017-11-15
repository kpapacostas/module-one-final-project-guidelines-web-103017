class AddPlaylistColumnToPlaylist < ActiveRecord::Migration[5.0]
  def change
    add_column :playlists, :song_list, :array
  end
end
