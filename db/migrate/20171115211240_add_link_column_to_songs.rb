class AddLinkColumnToSongs < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :song_link, :string
  end
end
