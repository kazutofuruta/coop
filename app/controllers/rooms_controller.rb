class RoomsController < ApplicationController
  def new
  	@room = Room.new
  end

  def create
   @room = Room.new(room_params)
   @room.shop_user_id = current_shop.id
   @room.save
   redirect_to  room_path(@room)
  end

  def index
  	@rooms = Room.all
  end

  def show
  	@room = Room.find(params[:id])
  	@talks = Talk.where(room_id: @room.id)
  	@talk = Talk.new
  end

  def edit
  end

  private

  def room_params
    params.require(:room).permit(:room_name, images:[ ])
  end

  def talk_params
  	params.require(:talk).permit(:word)
  end
end
