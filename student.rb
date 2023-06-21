require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(_classroom = 'unknown')
    super(age, name, parent_permission)
    @classroom = Classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
