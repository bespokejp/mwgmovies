class AddBackgroundToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :background, :string
  end
end
