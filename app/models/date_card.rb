class DateCard < ActiveRecord::Base
  has_many :songs, through: :playlist_date_cards
  has_one :user
  has_one :recipe
  has_one :drink

  
end
