class BankAccount

  #-------------CLASS VARIABLES-------------
  @@interest_rate = 0.07
  @@accounts = []

  def self.create()
    account = BankAccount.new
    @@accounts << account
    return account
  end

  def self.total_funds()

    total = 0

    @@accounts.each do |item|
      total = total + item.balance
    end

    return total

  end

  def self.interest_time()

    @@accounts.each do |item|

      item.balance += item.balance *  @@interest_rate

    end

  end

  #---------------INITIALIZE----------------
  def initialize
    @balance = 0
  end

  #----------------INSTANCE METHODS------------
  def balance
    return @balance
  end

  def balance=(new_amount)
    @balance = new_amount
  end

  def deposit(amt)
    @balance += amt
  end

  def withdraw(amt)
    @balance -= amt
  end

end


my_account = BankAccount.create
your_account = BankAccount.create
puts my_account.balance # 0
puts BankAccount.total_funds # 0
my_account.deposit(200)
your_account.deposit(1000)
puts my_account.balance # 200
puts your_account.balance # 1000
puts BankAccount.total_funds # 1200
BankAccount.interest_time
puts my_account.balance # 202.0
puts your_account.balance # 1010.0
puts BankAccount.total_funds # 1212.0
my_account.withdraw(50)
puts my_account.balance # 152.0
puts BankAccount.total_funds # 1162.0
