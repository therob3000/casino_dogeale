class User < ActiveRecord::Base
  has_many :bets
  has_many :accepted_bets
end
