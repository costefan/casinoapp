class PokerTable < ActiveRecord::Base
  validates :name,presence: true,length: {maximum: 20}
  has_many :relationships,dependent: :destroy
  has_many :users,through: :relationships
  validate :users_count

  private

  def users_count
    return if users.blank?
    errors.add("Too many Users") if users.size > 6
  end
end
