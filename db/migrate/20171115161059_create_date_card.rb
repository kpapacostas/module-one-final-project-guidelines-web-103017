class CreateDateCard < ActiveRecord::Migration[5.0]
  def change
    create_table :date_cards do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.integer :drink_id
      t.string :playlist_genre
    end
  end
end
