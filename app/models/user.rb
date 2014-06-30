class User < ActiveRecord::Base
  attr_reader :entered_password
  has_many :bets
  has_many :accepted_bets
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  #validates :address, presence: true
  validates :username, :length => { :minimum => 5, :message => "must be at least 5 characters doge!" }
  validates :entered_password, :length => { :minimum => 6 }
  after_save :get_new_address
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @entered_password = pass
    @password = Password.create(pass)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    user = User.find_by_username(username)
    return user if user && (user.password == password)
    nil # either invalid username or wrong password
  end

  private
  def get_new_address
    if self.address.nil?
      self.address  = DOGE.get_new_address(self.username)
      self.save
    end
  end

end
