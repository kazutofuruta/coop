class AddUserIdToBuyUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :buy_users, :user_id, :integer
  end
end
