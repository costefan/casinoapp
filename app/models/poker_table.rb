class PokerTable < ActiveRecord::Base
  validates :poker_table,presence: true,length: {maximum: 20}
end
