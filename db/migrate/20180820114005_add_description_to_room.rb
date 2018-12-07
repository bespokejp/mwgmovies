class AddDescriptionToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :headline, :string
    add_column :rooms, :description, :text
    add_column :rooms, :price, :integer
  end
end
