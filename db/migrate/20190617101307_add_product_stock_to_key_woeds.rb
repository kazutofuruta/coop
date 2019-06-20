class AddProductStockToKeyWoeds < ActiveRecord::Migration[5.2]
  def change
    add_column :key_words, :product_stock, :integer
  end
end
