class BuyUsersController < ApplicationController

	def index
		@buy_user = BuyUser.where(user_id: current_user.id)
	end

	def room_history
	   @room_history = BuyUser.where(room_id: params[:room_id])
	   @room = Room.find(params[:room_id])
	end
end
