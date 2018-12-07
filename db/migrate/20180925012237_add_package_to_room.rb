class AddPackageToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :package, :string
    add_column :rooms, :images, :json
  end
end
