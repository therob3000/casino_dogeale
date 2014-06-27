get '/bet/:id' do 
	@bet = Bet.find_by_id(params[:id])
	erb :bet
end

