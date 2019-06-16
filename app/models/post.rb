class Post < ApplicationRecord

# Postモデルのバリデーション
	validates :group_name, presence: true, length: {maximum: 20}
	validates :prefecture, presence: true
	validates :region, presence: true
	validates :description, presence: true, length: {maximum: 1000}

# アソシエーション
	belongs_to :user
	has_many :user_posts, dependent: :destroy

# enun設定　募集状態のステータスと県の情報を設定
	enum status: { 募集中: 1, 募集締切: 2}


end
