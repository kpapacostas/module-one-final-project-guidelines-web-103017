class RenameRecipeIdColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :recipe_date_cards, :song_id, :recipe_id
  end
end
