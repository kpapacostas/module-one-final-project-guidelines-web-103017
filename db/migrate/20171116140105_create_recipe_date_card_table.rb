class CreateRecipeDateCardTable < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_date_cards do |t|
      t.integer :date_card_id
      t.integer :song_id
    end
  end
end
