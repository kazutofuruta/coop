class KeyWordsController < ApplicationController


def create
	@key_word = KeyWord.new(key_word_params)
	@key_word.shop_user_id = current_shop.id
 	@key_word.save

	redirect_to  new_room_path
end

private

def key_word_params
    params.require(:key_word).permit(:key_word, :product_stock, :product_price)
  end
end
