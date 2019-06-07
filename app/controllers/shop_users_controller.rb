class ShopUsersController < ApplicationController
  def new
  	@shop_user = ShopUser.new
  end

  def create
   @shop_user = ShopUser.new(shop_user_params)

   if @shop_user.save
   	redirect_to shop_users_path, notice:"「#{@shop_user.shop_name}」店を登録しました。"
   else
   	render :new
   end
  end

  def edit
    @shop_user = ShopUser.find(params[:id])
  end

  def show
    @shop_user = ShopUser.find(params[:id])
  end

  def index
    @shop_users = ShopUser.all
  end

  def update
   @shop_user = ShopUser.find(params[:id])

   if @shop_user.update(shop_user_params)
      redirect_to shop_user_path(@shop_user), notice: "「#{@shop_user.shop_name}」店の登録更新しました。"

  else
    render :edit
  end
  end

  def destroy
    @shop_user = ShopUser.find(params[:id])
    @shop.destroy
    redirect_to shop_users_path,notice:"「#{@shop_user.shop_name}」店を削除しました。"
  end

  private

  def shop_user_params
  	params.require(:shop_user).permit(:shop_name, :owner, :shop_address, :email, :phone_number, :password, :password_confirmation, :image)
  end
end
