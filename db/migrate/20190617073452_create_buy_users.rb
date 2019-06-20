class CreateBuyUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_users do |t|
      t.string :buy_user
      t.string :buy_product
      t.string :buy_key
      t.string :price
      t.integer :buy_stock
      t.string :buy_user_address

      t.timestamps
    end
  end
end
