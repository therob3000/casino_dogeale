class User < ActiveRecord::Base
  attr_reader :entered_password

  has_many :bets
  has_many :accepted_bets

  validates :username, :length => { :minimum => 5, :message => "must be at least 5 characters doge!" }
  validates :entered_password, :length => { :minimum => 6 }

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

end
