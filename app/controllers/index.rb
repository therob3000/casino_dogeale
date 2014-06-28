get '/' do
  @bets = Bet.all
  @errors = session[:error]
  # session[:error].delete
  erb :index
end

get '/profile/:username' do
  @user = User.find_by(username: params[:username])
  erb :profile
end
