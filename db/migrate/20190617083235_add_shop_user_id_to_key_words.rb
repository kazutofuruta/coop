class AddShopUserIdToKeyWords < ActiveRecord::Migration[5.2]
  def change
    add_column :key_words, :shop_user_id, :integer
  end
end
