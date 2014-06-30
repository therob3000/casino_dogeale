helpers do
	def doge_balance
	  DOGE.get_balance(session[:username])
	end
end
