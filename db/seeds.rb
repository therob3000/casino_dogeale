require_relative '../app/models/user.rb'
require_relative '../app/models/bet.rb'

adrian = User.create(username: "adrian", email: "adriansoghoian@gmail.com", password: "password")
# Dogedler.create(unique_holder: "a00")


adrian.bets << Bet.create(title: "test4", total: "100.00", content: "yo")
adrian.bets << Bet.create(title: "test5", total: "100.00", content: "sup")
adrian.bets << Bet.create(title: "test6", total: "100.00", content: "chill")

