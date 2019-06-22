class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

# 論理削除用の記述
  acts_as_paranoid

# deviseの初期設定
	devise :database_authenticatable, :registerable,
  		   :recoverable, :rememberable, :validatable

# ユーザー情報のバリデーション
  validates :user_name, presence: true, length: {maximum: 20}
  validates :email, presence: true, uniqueness: true, length: {maximum: 254}
  validates :profile, length: {maximum: 500}

# アソシエーション、ユーザーが削除されたら付随するデータも消える
	has_many :posts, dependent: :destroy
	has_many :user_posts, dependent: :destroy
  has_many :messages, dependent: :destroy
# コメントするUserとの関係
  has_many :active_comments, class_name: "Comment", dependent: :destroy, foreign_key: :commenting_id
  has_many :commentings, through: :active_comments, source: :commented
# コメントされるユーザーとの関係
  has_many :passive_comments, class_name: "Comment", dependent: :destroy, foreign_key: :commented_id
  has_many :commenteds, through: :passive_comments, source: :commenting

# refileカラム用
	attachment :image

def commented_by?(user)
  passive_comments.find_by(commenting_id: user.id)
end

end
