class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :room_name, null: false
      t.integer :shop_user_id, null:false

      t.timestamps
    end
  end
end
