class ShopUser < ApplicationRecord
	has_secure_password

	has_one_attached :image

	validates :shop_name, presence: true
	validates :owner, presence: true
	validates :email, presence: true
	validates :phone_number, presence: true
	validates :shop_address, presence: true

	has_many :rooms
end
