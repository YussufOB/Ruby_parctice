require "./animal.rb"

class Spider < Animal
  def initialize(web_strenght_level, name = "Unknown")
    super("spider", 8, name)
    @web_strenght_level = web_strenght_level
  end
  def make_a_web
    "www"
  end
  def speak
    "..."
  end
end