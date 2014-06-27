class AcceptedBet < ActiveRecord::Base
  belongs_to :bet
  belongs_to :user
  before_save :generate_holder

  private
  def generate_holder
    doge.create('')
    self.holder =
  end
end
