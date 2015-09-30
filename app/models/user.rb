class User < ActiveRecord::Base
  before_save { email.downcase! }
  VALID_MAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_MAIL },uniqueness: {case_sensitive: false}
  validates :name,  presence: true, length: { maximum: 50 }
end
