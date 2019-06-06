class ShopUser < ApplicationRecord
	has_secure_password

	validates :shop_name, presence: true
	validates :owner, presence: true
	validates :email, presence: true
	validates :phone_number, presence: true
	validates :shop_address, presence: true
end
