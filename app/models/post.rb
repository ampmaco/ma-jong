class Post < ApplicationRecord

# Postモデルのバリデーション
	validates :group_name, presence: true, length: {maximum: 20}
	validates :prefecture, presence: true
	validates :region, presence: true
	validates :description, presence: true, length: {maximum: 1000}

# アソシエーション
	belongs_to :user
	has_many :joins, dependent: :destroy

# enun設定　募集状態のステータスと県の情報を設定
	enum status: { 募集中: 1, 募集締切: 2}

# joinsテーブルのユーザーカラム(:user_id)にuser.idが存在するかを確認する
	def joined_by?(user)
		joins.where(user_id: user.id).exists?
	end

end
