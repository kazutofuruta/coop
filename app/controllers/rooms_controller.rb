class RoomsController < ApplicationController
  def new
  	@room = Room.new
    @key_words = KeyWord.where(shop_user_id: current_shop.id)
    @key_word = KeyWord.new
  end

  def create
   @room = Room.new(room_params)
   @room.shop_user_id = current_shop.id
   @room.save
   @key_words = KeyWord.where(shop_user_id: current_shop.id)
     @key_words.each do |key_word|
      key_word.room_id = @room.id
      key_word.shop_user_id = nil
      key_word.save
    end

   redirect_to  room_path(@room)
  end

  def index
  	@rooms = Room.all
    @rooms.each do |room|
    @key_word = KeyWord.where(room_id: room.id)

    key_words = @key_word.pluck(:product_stock)

    if key_words.join.to_i == 0
    room.room_alert = 1
    room.save
    end

    end
  end

  def picture_index
    @shop_user = ShopUser.all
  end

  def shop_show
    @rooms = Room.where(shop_user_id: params[:shop_user_id])
  end


  def destroy
     @room = Room.find(params[:id])
     @room.destroy

     redirect_to rooms_path
  end

  def show
  	@room = Room.find(params[:id])
  	@talks = Talk.where(room_id: @room.id)
  	@talk = Talk.new
    @key_word = KeyWord.where(room_id: @room.id)
  end

  def edit
  end

  private

  def room_params
    params.require(:room).permit(:room_name,:room_alert,images:[ ])
  end

  def talk_params
  	params.require(:talk).permit(:word)
  end

  def key_word_params
    params.require(:key_word).permit(:key_word)
  end
end
