class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :charge_id, null: false
      t.integer :user_id, null: false
      t.integer :room_id, null: false

      t.timestamps
    end
  end
end
