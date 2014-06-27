class AcceptedBet < ActiveRecord::Base
  validates :amount, numericality:{ greater_than: 0 }
  belongs_to :bet
  belongs_to :user
  before_save :create_holder

  private
   def create_holder
    self.holder = Dogedler.create.unique_holder
    doge.create_user(user_id: self.holder)
  end
end
