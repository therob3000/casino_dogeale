get '/bet/create' do
  @error = "not enough money to place bet add more doge" if params[:e] == 'n'
  erb :bet_create
end

get '/tag/:name' do
  @tag = Tag.find_by(name: params[:name])
  @bets = tag.bets.order(:created_at).reverse_order
  erb :tag
end

post '/bet/create' do
  bet = params[:bet]
  bet[:remainder] = bet[:total]
  user = User.find_by_id(session[:id])
  user_balance = DOGE.get_user_balance(user_id: user.username)
  if user_balance >= bet[:total]
    user.bets << Bet.create(bet)
    DOGE.move_to_user(to_user_id: user.bets.last.holder, from_user_id: user.username, amount_doge: bet[:total])
    redirect "/bet/#{user.bets.last.id}"
  else
    redirect '/bet/create?e=n'
    #redirect 'http://www.gamblersanonymous.org/'
  end
end

get '/bet/:id' do
  @error = "not enough money to place bet add more doge" if params[:e] == 'n'
	@bet = Bet.find_by_id(params[:id])
  @bets = @bet.accepted_bets.order(:created_at).reverse_order
	erb :bet
end

post '/bet/:id' do
  bet = Bet.find_by_id(params[:id])
  user = User.find_by_id(session[:id])
  user_balance = DOGE.get_user_balance(user_id: user.username)
  accepted_bet_values = {user_id: user.id, amount: params[:amount].to_f}
  if user_balance >= accepted_bet_values[:amount]
    bet.accepted_bets << Accepted_bet.create(accepted_bet_values)
    DOGE.move_to_user(to_user_id: bet.accepted_bets.last.holder, from_user_id: user.username, amount_doge: accepted_bet_values[:amount])
    DOGE.move_to_user(to_user_id: bet.accepted_bets.last.holder, from_user_id: bet.holder, amount_doge: accepted_bet_values[:amount])
    bet.remainder -= accepted_bet_values[:amount]
    redirect '/'
  else
    redirect '/bet/:id?e=n'
  end
end

