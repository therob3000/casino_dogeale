class Bet < ActiveRecord::Base
  validates :total, numericality:{ greater_than: 0 }
  has_many :accepted_bets
  has_and_belongs_to_many :tags
  belongs_to :user
  before_save :create_holder
  before_save :set_status

 def expired?
    return true if (self.expiration - Time.now) <= 0
    false
  end

  private
  def create_holder
    if self.holder.nil?
      key = Dogedler.create
      self.holder = key.unique_holder
      DOGE.get_new_address(self.holder)
    end
  end

  def set_status
    if self.status.nil?
      self.status = 'open'
    end
  end

end
