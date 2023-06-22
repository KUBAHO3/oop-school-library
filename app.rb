require_relative './book.rb'
require_relative './teacher.rb'
require_relative '.student.rb'
require_relative '.rental.rb'

class App
  attr_accessor :books, :teachers, :students, :rentals,
  
  def initialize
    @books = []
    @teachers = []
    @students = []
    @rentals = []
  end

  def book_list
    @books.each_with_index { |book, index| print "(#{index + 1}) Title: \"#{book.title}\", Author: \"#{book.author}\"\n"}
  end

  def people_list
    people = [*@students, *@teachers]
    people.each_with_index { |person, index| print "(#{index + 1}) Name: \"#{person.name}\", Age: \"#{person.age}\"\n"}
  end

  def rental_list
    puts "Please enter person's id to see rentals"
    id = gets.chomp
    @rentals.each do |rental|
      print "Date: #{rental.date}, Title: #{rental.book.title}, Author: #{rental.book.author}\n" if id == rental.person.id
    end
  end

  def create_person
    print "Choose whom you want to create\n (1)Student\n (2)Teacher"
    creator = gets.chomp.to_i

    case creator
    when 1
      print "Enter the Name: "
      name = gets.chomp.to_s
      print "Enter the Age: "
      age = gets.chomp.to_i
      print "Enter the Classroom: "
      classroom = gets.chomp
      new_student = Student.new(age, classroom)
      new_student.name = name
      @students << new_student
      print "#{new_student.name} was added successfully"

    when 2
      print "Enter the Name: "
      name = gets.chomp
      print "Enter the Age: "
      age = gets.chomp.to_i
      print "Enter the Specialization: "
      speecialization = gets.chomp
      new_teacher = Teacher.new(age, name, speecialization)
      @teachers << new_teacher
      puts "#{new_teacher.name} was added successfully" 
    end
  end
end