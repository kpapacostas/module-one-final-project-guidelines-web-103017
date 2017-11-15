
class User < ActiveRecord::Base
  has_many :date_cards
  has_many :drinks, through: :date_cards
  has_many :recipes, through: :date_cards
  has_many :songs



  def init_dc
    new_card = DateCard.create
    new_card.user_id = self.id
    new_card.save
  end

end
