require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, id, name = 'Unknown', parent_permission: true)
    super(id, name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
