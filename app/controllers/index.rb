get '/' do
  @bets = Bet.all
  erb :index
end

get '/profile/:username' do
  @user = User.find_by(username: params[:username])
  erb :profile
end
