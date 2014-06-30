helpers do
  def expiration_parse(string)
    DateTime.parse(string)
  end

  def process_tags(tags)
  	p "HELLO"
  	p tags
    p_tags = []
    tags.split(',').uniq.each{|tag|
    s_tag = tag.strip
    s_tag.gsub!(/[^0-9a-zA-Z\s]/, '')
      if Tag.new(name:s_tag).valid?
        new_tag = Tag.create(name: s_tag)
      else
        new_tag = Tag.find_by(name: s_tag)
      end
      p_tags << new_tag
    }
    p_tags
  end

  def assign_tags!(bet, tags)
  	p_tags = process_tags(tags)
	  p_tags.each{|tag|
	    bet.tags << tag
	  }
  end

end
