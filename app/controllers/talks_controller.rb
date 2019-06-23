class TalksController < ApplicationController
  def new
  end

  def edit
  end

  def create
     @talk = Talk.new(talk_params)
     @room = Room.find(params[:room_id])
     @talk.room_id = @room.id

    if current_user
     @talk.user_id = current_user.id
     @talk.user_name = current_user.name
    elsif current_shop
     @talk.shop_user_id = current_shop.id
     @talk.user_name = current_shop.shop_name
    end

     @talk.save
     @key_words = KeyWord.where(room_id: @room.id)
     @buy_user = BuyUser.new

    if current_user
     product_key = @key_words.pluck(:key_word) #カラム（key_word）のデータを配列として取得

     product_key.each do |key_word|  #配列の中身をeach文で回す

      # word = @talk.word
      # key = key_word.key_word
      #binding.pry
         stock = @talk.word.chars - key_word.chars
         buy_stock = @talk.word.chars - stock

         if stock.join == "" || stock.join.tr('０-９ａ-ｚＡ-Ｚ','0-9a-zA-Z').to_i != 0

           if key_word == buy_stock.join

          # max_l = (word.chars & key.chars)
           #min_l = (@talk.word.chars - key_word.chars)

           if stock.join.tr('０-９ａ-ｚＡ-Ｚ','0-9a-zA-Z').to_i != 0
             @buy_user.buy_stock = stock.join.tr('０-９ａ-ｚＡ-Ｚ','0-9a-zA-Z').to_i
           else
            @buy_user.buy_stock = 1
           end


        # binding.pry
        product = @key_words.where(key_word: key_word).first

        if product.product_stock >= @buy_user.buy_stock


        product.product_stock -= @buy_user.buy_stock

           product.save

            @buy_user.buy_product = key_word

            @buy_user.buy_shop_name = @room.shop_user.shop_name

            @buy_user.price = product.product_price

            @buy_user.price_total = product.product_price * @buy_user.buy_stock

            @buy_user.user_id = current_user.id

            @buy_user.buy_user = current_user.name

            @buy_user.buy_user_address = current_user.address

            @buy_user.room_id = @room.id

            @buy_user.save

            @talk.alert = 3

            @talk.save

        elsif  product.product_stock == 0
          flash[:notice] = "※購入できません。※「#{key_word}は完売しました。」"

           @talk.alert = 2
           @talk.save
        else
           flash[:notice] = "※購入できません。※「#{key_word}は残り#{product.product_stock}です」 購入数「#{@buy_user.buy_stock}」"

           @talk.alert = 1
           @talk.save
         end

       end

      end
    end
   end

   if @buy_user.buy_product != nil
    redirect_to room_path(@room), notice: "「#{@buy_user.buy_product}/#{@buy_user.buy_stock}」「#{@buy_user.created_at.strftime('%H時%M分%S秒')}」 購入完了"
  else

     redirect_to room_path(@room)
   end
  end

  def destroy
     @talks = Talk.where(user_id: current_user.id)
     @talks.destroy_all

     redirect_to rooms_path
  end

  def destroy_talk
    @talk = Talk.find(params[:talk_id])
    @talk.destroy

    redirect_to room_path(@talk.room_id)
  end

  def index
  end

  def show
  end

private


  def talk_params
  	params.require(:talk).permit(:word, :alert)
  end

  def buy_user_params
    params.require(:buy_user).permit(:buy_product, :price, :price_total)
  end

  def key_word_params
    params.require(:key_word).permit(:key_word, :product_stock, :product_price)
  end
end
