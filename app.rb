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
end