class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: session_params[:email])

    shop_user = ShopUser.find_by(email: session_params[:email])

  	if user&.authenticate(session_params[:password])
  		session[:user_id] = user.id
  		redirect_to root_path, notice: 'ログインしました。'
  	elsif shop_user&.authenticate(session_params[:password])
      session[:shop_user_id] = shop_user.id
      redirect_to root_path, notice: 'ログインしました。'
    else
  		render :new
  	end
  end

  def destroy
     reset_session
     redirect_to root_path, notice: 'ログアウトしました。'
  end

  private

  def session_params
  	params.require(:session).permit(:email, :password)
  end
end
