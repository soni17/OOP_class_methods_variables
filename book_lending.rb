class Book

  #---------------CLASS VARIABLES------------------
  @@on_shelf = []
  @@on_loan = []

  attr_accessor :due_date

  # --------------CLASS METHODS-------------------
  def self.create(title,author,isbn)
    newbook = Book.new(title,author,isbn)
    @@on_shelf << newbook
    return newbook
  end

  def self.available()
    return @@on_shelf
  end

  def self.borrowed()
    return @@on_loan
  end

  def self.browse()
    return @@on_shelf.sample
  end

  def self.current_due_date()
    Time.now + 604800
  end

  def self.overdue()
    @@on_loan.map{ |book|
      book.due_date < Time.now
    }
  end

  #------------------INITIALIZE---------------
  def initialize(title,author,isbn)
    @due_date
    @title = title
    @author = author
    @isbn = isbn
  end

  #---------------INSTANCE METHODS---------------
    def lent_out?()
    @@on_loan.include?(self)
  end

  def borrow()
    return false if lent_out?()
    self.due_date = Book.current_due_date()

    @@on_shelf.delete(self)
    @@on_loan <<  self

    return true

  end

  def return_to_library()
    return false if (lent_out?() == false)

    @@on_loan.delete(self)
    @@on_shelf << self
    self.due_date = nil

    return true

  end

end

sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")
puts Book.browse.inspect
puts Book.browse.inspect
puts Book.browse.inspect
puts Book.available.inspect
puts Book.borrowed.inspect
puts sister_outsider.lent_out?
puts sister_outsider.borrow
puts sister_outsider.lent_out?
puts sister_outsider.borrow
puts sister_outsider.due_date
puts Book.available.inspect
puts Book.borrowed.inspect
puts Book.overdue.inspect
puts sister_outsider.return_to_library
puts sister_outsider.lent_out?
puts Book.available.inspect
puts Book.borrowed.inspect
