class User < ActiveRecord::Base
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  has_many :bets
  has_many :accepted_bets
end
