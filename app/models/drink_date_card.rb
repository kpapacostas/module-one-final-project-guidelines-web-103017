class DrinkDateCard < ActiveRecord::Base
  has_many :date_card_ids
  has_many :drink_ids 
end
