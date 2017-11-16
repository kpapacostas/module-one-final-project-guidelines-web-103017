class CreateDrinkDateCardTable < ActiveRecord::Migration[5.0]
  def change
    create_table :drink_date_cards do |t|
      t.integer :date_card_id
      t.integer :drink_id
    end
  end
end
