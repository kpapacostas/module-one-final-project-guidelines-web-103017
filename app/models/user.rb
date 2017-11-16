
class User < ActiveRecord::Base
  has_many :date_cards
  has_many :drinks, through: :date_cards
  has_many :recipes, through: :date_cards
  has_many :songs

end
