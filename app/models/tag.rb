class Tag < ActiveRecord::Base
  has_and_belongs_to_many :bets
  validates :name, uniqueness: true
end
