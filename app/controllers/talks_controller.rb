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
     redirect_to room_path(@room)
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
  	params.require(:talk).permit(:word)
  end
end
