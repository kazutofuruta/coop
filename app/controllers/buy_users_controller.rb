class BuyUsersController < ApplicationController

	def index
		@buy_user = BuyUser.where(user_id: current_user.id)
	end
end
