class PlaylistDateCard < ActiveRecord::Base
  has_many :date_card_ids
  has_many :song_ids
end
