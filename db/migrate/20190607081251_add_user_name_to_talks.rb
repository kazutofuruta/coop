class AddUserNameToTalks < ActiveRecord::Migration[5.2]
  def change
    add_column :talks, :user_name, :string
  end
end
