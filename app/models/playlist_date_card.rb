class PlaylistDateCard < ActiveRecord::Base
  has_many :playlist_ids
  has_many :song_ids
end
