helpers do
def doge_balance
  doge_parse(DOGE.get_user_balance(user_id: session[:username]))["data"]["balance"].to_f
end
end
