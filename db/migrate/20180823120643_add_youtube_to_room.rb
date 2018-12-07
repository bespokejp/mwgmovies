class AddYoutubeToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :youtube, :string
  end
end
