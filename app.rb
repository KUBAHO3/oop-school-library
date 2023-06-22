require './book'
require './teacher'
require './student'
require './rental'

class App
  attr_accessor :books, :teachers, :students, :rentals

  def initialize
    @books = []
    @teachers = []
    @students = []
    @rentals = []
  end

  def book_list
    print "\nSorry you can't find any books\n" if @books.empty?
    @books.each_with_index do |book, index|
      print "\n(#{index + 1}) Title: \"#{book.title}\", Author: \"#{book.author}\"\n"
    end
  end

  def people_list
    print "\nSorry you can't find any person\n" if people.empty?
    people = [*@students, *@teachers]
    people.each_with_index do |person, index|
      print "\n(#{index + 1}) Name: \"#{person.name}\", Age: \"#{person.age}\"\n"
    end
  end

  def rental_list
    puts "Please enter person's id to see rentals"
    id = gets.chomp
    print "\nSorry you can't find any rentals\n" if @rentals.empty?
    @rentals.each do |rental|
      if id == rental.person.id
        print "\nDate: #{rental.date}, Title: #{rental.book.title}, Author: #{rental.book.author}\n"
      end
    end
  end

  def create_book
    print 'Book Title:'
    title = gets.chomp
    print 'Book Author:'
    author = gets.chomp
    new_book = Book.new(title, author)
    @books << new_book
    puts "#{new_book.title} created successfully"
  end

  def create_rental
    print "Select a book from the following list by number \n"
    book_list
    book = gets.chomp.to_i
    print "select a person \n"
    people_list
    person = gets.chomp.to_i
    print 'select a date'
    date = gets.chomp
    people = [*@teachers, *@students]
    new_rental = Rental.new(date, @books[book], people[person])
    @rentals << new_rental
    print 'Rental created successfully'
  end

  def create_person
    print "Choose whom you want to create\n (1)Student\n (2)Teacher\n"
    creator = gets.chomp.to_i

    case creator
    when 1
      print 'Enter the Name: '
      name = gets.chomp.to_s
      print 'Enter the Age: '
      age = gets.chomp.to_i
      print 'Enter the Classroom: '
      classroom = gets.chomp
      new_student = Student.new(age, classroom)
      new_student.name = name
      @students << new_student
      print "\n#{new_student.name} was added successfully"

    when 2
      print 'Enter the Name: '
      name = gets.chomp
      print 'Enter the Age: '
      age = gets.chomp.to_i
      print 'Enter the Specialization: '
      speecialization = gets.chomp
      new_teacher = Teacher.new(age, name, speecialization)
      @teachers << new_teacher
      puts "\n#{new_teacher.name} was added successfully"
    end
  end
end
