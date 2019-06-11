class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

# deviseの初期設定
	devise :database_authenticatable, :registerable,
  		   :recoverable, :rememberable, :validatable

# ユーザー情報のバリデーション
  	validates :user_name, presence: true, length: {maximum: 20}
  	validates :email, presence: true, uniqueness: true, length: {maximum: 254}
  	validates :profile, length: {maximum: 500}

# アソシエーション
	has_many :posts

end
