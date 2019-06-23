class AddRoomIdToBuyUser < ActiveRecord::Migration[5.2]
  def change
    add_column :buy_users, :room_id, :integer
  end
end
