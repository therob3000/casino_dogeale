class AcceptedBet < ActiveRecord::Base
  validates :amount, numericality:{ greater_than: 0 }
  belongs_to :bet
  belongs_to :user
  before_save :create_holder
  before_save :set_status

  private
   def create_holder
    if self.holder.nil?
      x = Dogedler.create
      self.holder = x.unique_holder
      DOGE.get_new_address(self.holder)
    end
  end

  def set_status
    self.status = 'open'
  end
end
