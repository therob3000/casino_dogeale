class Bet < ActiveRecord::Base
  has_many :accepted_bets
  has_and_belongs_to_many :tags
  belongs_to :user
end
