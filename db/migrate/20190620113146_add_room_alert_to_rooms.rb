class AddRoomAlertToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :room_alert, :integer
  end
end
