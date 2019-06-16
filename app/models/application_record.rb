class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # joinsテーブルのユーザーカラム(:user_id)にuser.idが存在するかを確認する
	def joined_by?(user)
		user_posts.where(user_id: user.id).exists?
	end

end