class RenameBuyKeyColumnToBuyUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :buy_users, :buy_key, :price_total
  end
end
