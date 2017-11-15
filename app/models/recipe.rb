class Recipe < ActiveRecord::Base
  has_many :date_cards
  has_many :users
end
