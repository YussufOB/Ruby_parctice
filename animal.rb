require "./animal.rb"
require "./dog.rb"
require "./spider.rb"
require "./owner.rb"

class Animal
  attr_accessor :owner

  def initialize(name = "Unknown", type, number_of_legs)
    @id = Random.rand(1..1000)
    @name = name
    @number_of_legs = number_of_legs
    @type = type 
  end
  def id
    @id
  end
  def type
    @type
  end
  def number_of_legs
    @number_of_legs
  end
  attr_accessor :name
  def speak(animal)
    "grrrr"
  end
end

animal_1 = Animal.new("Demmy", 4)
animal_2 = Animal.new("Biglouie", 8)

animal_1.speak("dog")
animal_2.speak("spider")

dog = Dog.new("black", "Rax")
spider = Spider.new(85, "Bob")
animal = Animal.new("lion", 4, "Some name")

alex = Owner.new("Alex")
alex.animals
alex.add_animal(dog)
alex.animals
alex.add_animal(spider)
alex.animals
alex.add_animal(animal)
alex.animals.map {|animal| animal.name}

alex.animals.count
alex.animals.first.name
alex.animals.first.number_of_legs