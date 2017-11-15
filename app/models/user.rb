class User < ActiveRecord::Base
  has_many :date_cards
  has_many :drinks, through: :date_cards
  has_many :recipes, through: :date_cards
  has_many :playlists, through: :date_cards

  def initialize(name, date_name)
    @name = name
    @date_name = date_name
    DateCard.new(user_id = self.id)
  end


end
