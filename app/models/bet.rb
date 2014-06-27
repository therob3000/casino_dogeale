class Bet < ActiveRecord::Base
  has_many :accepted_bets
  has_and_belongs_to_many :tags
  belongs_to :user
  before_save :create_holder

  private
  def create_holder
    self.holder = Dogedler.create.unique_holder
    doge.create_user(user_id: self.holder)
  end
end
