class User < ActiveRecord::Base
  has_many :relationships,dependent: :destroy
  has_many :poker_tables,through: :relationships
  before_save { email.downcase! }
  VALID_MAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_MAIL },uniqueness: {case_sensitive: false}
  validates_associated :poker_tables
end
