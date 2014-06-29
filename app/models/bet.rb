class Bet < ActiveRecord::Base
  validates :total, numericality:{ greater_than: 0 }
  has_many :accepted_bets
  has_and_belongs_to_many :tags
  belongs_to :user
  before_save :create_holder
  before_save :set_status

  private
  def create_holder
    self.holder = Dogedler.create.unique_holder
    DOGE.create_user(user_id: self.holder)
  end

  def set_status
    self.status = 'open'
  end
end
