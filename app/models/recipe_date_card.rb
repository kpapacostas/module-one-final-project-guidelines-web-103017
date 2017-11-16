class RecipeDateCard <ActiveRecord::Base
  has_many :date_card_ids
  has_many :recipe_ids
end
