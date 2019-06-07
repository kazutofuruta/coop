class CreateTalks < ActiveRecord::Migration[5.2]
  def change
    create_table :talks do |t|
      t.string :word
      t.integer :room_id, null: false
      t.integer :user_id
      t.integer :shop_user_id

      t.timestamps
    end
  end
end
