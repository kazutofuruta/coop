class AddBuyShopNameToBuyUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :buy_users, :buy_shop_name, :string
  end
end
