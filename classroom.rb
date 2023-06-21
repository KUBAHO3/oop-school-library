require_relative './student'

class Classroom < Student
  attr_accessor :label, :student

  def initialize(label)
    super()
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end
