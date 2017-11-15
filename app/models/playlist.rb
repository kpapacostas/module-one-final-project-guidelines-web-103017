class Playlist < ActiveRecord::Base
  has_many :songs
  has_many :date_cards
  has_many :users 
end
