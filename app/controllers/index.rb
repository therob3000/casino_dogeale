get '/' do
  @bets = Bet.all
  erb :index
end

get '/profile/:username' do
  @user = User.find_by_id(session[:user_id])
  erb :profile
end
