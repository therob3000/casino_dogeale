helpers do
  def expiration_parse(string)
    DateTime.strptime(string, "%Y-%m-%d %H:%M:%S")
  end
end
