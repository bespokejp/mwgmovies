class AddDefaultPriceToRoom < ActiveRecord::Migration[5.2]
  def change
    change_column :rooms, :price, :integer, default: 0
  end
end