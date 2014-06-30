helpers do 
	def check_bets(bet)
	  bet.accepted_bets.each{|a_bet| 
	  	return true if a_bet.user_id == session[:user_id]
    }
    false
	end
end