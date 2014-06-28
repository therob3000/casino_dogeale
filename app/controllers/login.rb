

post '/sign_in' do
  @username = params[:username]
  user = User.authenticate(@username, params[:password])
  if user
    session[:user_id] = user.id
    session[:username] = user.username
    session[:address] = user.address
    redirect '/'
  else
    @error = "Invalid username or password."
    redirect '/'
  end
end


# sign up

# get '/users/new' do
#   @user = User.new
#   erb :sign_up
# end

post '/sign_up' do
  user = User.new params[:user]
  if user.save
    session[:user_id] = @user.id
    session[:username] = user.username
    session[:address] = user.address
    redirect '/'
  else
    erb :index
  end
end

# sign out

get '/sign_out' do
  session.clear
  redirect '/'
end
