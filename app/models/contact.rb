class Contact < ApplicationRecord

# ユーザー情報のバリデーション
  validates :contact_name, presence: true, length: {maximum: 25}
  validates :contact_email, presence: true, length: {maximum: 254}
  validates :contact_body, presence: true, length: {maximum: 1000}

end
