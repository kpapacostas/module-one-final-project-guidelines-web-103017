class User < ActiveRecord::Base
  has_many :date_cards
  has_many :drinks, through: :date_cards
  has_many :recipes, through: :date_cards
  has_many :songs

  after_initialize do
    new_card = DateCard.create(user_id: self.id)
    new_card.save
  end

end
