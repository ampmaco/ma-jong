class Comment < ApplicationRecord

# バリデーション
	validates :rate, presence: true, length: {in: 1..5}
	validates :comment_body, presence: true, length: {maximum: 1000}

# Commentsテーブルのアソシエーション
	belongs_to :commenting, class_name: "User"
	belongs_to :commented, class_name: "User"
end
