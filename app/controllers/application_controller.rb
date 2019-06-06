class ApplicationController < ActionController::Base
	helper_method :current_user
	helper_method :current_shop

	private

	def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
	end

	def current_shop
       @current_shop ||= ShopUser.find_by(id: session[:shop_user_id]) if session[:shop_user_id]
	end
end
