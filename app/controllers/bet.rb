get '/bet/create' do
  @error = "not enough money to place bet add more doge" if params[:e] == 'n'
  erb :bet_create
end

post '/bet/create' do
  bet = params[:bet]
  p bet
  bet[:expiration] = expiration_parse(bet[:expiration])
  bet[:remainder] = bet[:total].to_f
  user, user_balance = User.find_by_id(session[:user_id]), doge_balance
  if user_balance >= bet[:remainder]
    new_bet = Bet.create(bet)
    user.bets << new_bet
    assign_tags!(new_bet, params[:tags])
    DOGE.move(user.username, user.bets.last.holder, bet[:remainder])
    redirect "/bet/#{user.bets.last.id}"
  else
    redirect '/bet/create?e=n'
    #redirect 'http://www.gamblersanonymous.org/'
  end
end

get '/tag/:name' do
  @tag = Tag.find_by(name: params[:name])
  @bets = @tag.bets.order(:created_at).reverse_order
  erb :tag
end

get '/bet/:id' do
  @error = "not enough money to place bet add more doge" if params[:e] == 'n'
	@bet = Bet.find_by_id(params[:id])
  @bets = @bet.accepted_bets.order(:created_at).reverse_order
	erb :bet
end

post '/bet/:id' do
  bet, user = Bet.find_by_id(params[:id]), User.find_by_id(session[:user_id])
  user_balance = doge_balance
  accepted_bet_values = {user_id: user.id, amount: params[:amount].to_f}
  if user_balance >= accepted_bet_values[:amount] && bet.remainder >= accepted_bet_values[:amount]
    bet.accepted_bets << AcceptedBet.create(accepted_bet_values)
    DOGE.move(user.username, bet.accepted_bets.last.holder, accepted_bet_values[:amount])
    DOGE.move(bet.holder, bet.accepted_bets.last.holder, accepted_bet_values[:amount])
    bet.remainder -= accepted_bet_values[:amount]
    bet.save
    redirect '/'
  else
    redirect '/bet/:id?e=n'
  end

end

