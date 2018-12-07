class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :s3_key
      t.integer :room_id, null: false

      t.timestamps
    end
  end
end
