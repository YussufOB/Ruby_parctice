class GenericParser
  def parse(type)
    puts "The Parser class received the parse method"
  
    if type == :xml
      puts "An instance of the XmlParser recieved the parse message"
    elsif type == :json
      puts "An instance of the JsonParser recieved the parser message"
    end
  end
end

class InheritanceParser
  def parse(parser)
    puts "The Parser class recieved the parse method"
    parser.parse
  end
end

class XmlParser
  def parse
    puts "An instance of the XmlParser class recieved the parse message"
  end
end

class JsonParser
  def parse
    puts "An instance of JsonParser class recieved the parse message"
  end
end