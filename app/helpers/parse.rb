helpers do
  def doge_parse(string)
    string.gsub!(/[:]/, '=>')
    string.gsub!(/[\\\\]/, '')
    eval(string)
  end
end
