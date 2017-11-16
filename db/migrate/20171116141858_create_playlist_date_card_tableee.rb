class CreatePlaylistDateCardTableee < ActiveRecord::Migration[5.0]
  def change
    create_table :playlist_date_cards do |t|
      t.integer :song_id
      t.integer :date_card_id
    end
  end
end
