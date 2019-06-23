class AddAlertToTalks < ActiveRecord::Migration[5.2]
  def change
    add_column :talks, :alert, :integer
  end
end
