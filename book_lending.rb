class Book

  #---------------CLASS VARIABLES------------------
  @@on_shelf = []
  @@on_loan = []

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
  def due_date
    return @due_date
  end

  def change_due_date(new_date)
    @due_date = new_date
  end

  def lent_out?()
    @@on_loan.include?(self)
  end

  def borrow()
    return false if lent_out?()
    @due_date = Book.current_due_date()

    @@on_shelf.delete(self)
    @@on_loan <<  self

    return true

  end

  def return_to_library()
    return false if (lent_out?() == false)

    @@on_loan.delete(self)
    @@on_shelf << self
    @due_date = nil

    return true

  end

end


sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")
puts Book.browse.inspect # #<Book:0x00555e82acdab0 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221"> (this value may be different for you)
puts Book.browse.inspect # #<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307"> (this value may be different for you)
puts Book.browse.inspect # #<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307"> (this value may be different for you)
puts Book.available.inspect # [#<Book:0x00555e82acde20 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431">, #<Book:0x00555e82acdce0 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00555e82acdab0 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">]
puts Book.borrowed.inspect # []
puts sister_outsider.lent_out? # false
puts sister_outsider.borrow # true
puts sister_outsider.lent_out? # true
puts sister_outsider.borrow # false
puts sister_outsider.due_date # 2017-02-25 20:52:20 -0500 (this value will be different for you)
puts Book.available.inspect # [#<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00562314675fd8 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">]
puts Book.borrowed.inspect # [#<Book:0x00562314676208 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431", @due_date=2017-02-25 20:55:17 -0500>]
puts Book.overdue.inspect # []
puts sister_outsider.return_to_library # true
puts sister_outsider.lent_out? # false
puts Book.available.inspect # [#<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00562314675fd8 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">, #<Book:0x00562314676208 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431", @due_date=nil>]
puts Book.borrowed.inspect # []
