class AddLiquorToDrinks < ActiveRecord::Migration[5.0]
  def change
    add_column :drinks, :liquor, :string
  end
end
