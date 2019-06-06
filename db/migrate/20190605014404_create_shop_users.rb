class CreateShopUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_users do |t|
      t.string :shop_name, null: false
      t.string :owner, null: false
      t.string :email, null: false
      t.string :shop_address, null: false
      t.string :phone_number, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
