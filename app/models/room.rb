class Room < ApplicationRecord

	  has_many_attached :images

      belongs_to :shop_user
      has_many :buy_users
      has_many :talks
      has_many :key_words
end
