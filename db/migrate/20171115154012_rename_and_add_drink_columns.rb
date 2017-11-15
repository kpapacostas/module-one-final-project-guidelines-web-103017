class RenameAndAddDrinkColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :drinks, :description, :instructions
    add_column :drinks, :ingredients, :string
  end
end
