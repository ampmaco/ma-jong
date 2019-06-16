class Message < ApplicationRecord

#  messagesテーブルのバリデーション
	validates :body, presence: true, length: {maximum: 1000}

# アソシエーション
	belongs_to :user
	belongs_to :post
end
