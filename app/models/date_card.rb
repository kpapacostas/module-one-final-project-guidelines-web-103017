class DateCard < ActiveRecord::Base
  has_many :songs, through: :playlist_date_cards
  belongs_to :user
  belongs_to :recipe
  belongs_to :drink


end
