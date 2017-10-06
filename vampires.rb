class Vampire

  #-------------CLASS VARIABLES-----------------
  @@coven = []

  #---------------CLASS METHODS---------------
  def self.create(name)
    newVamp = Vampire.new(name)
    @@coven << newVamp
    return newVamp
  end

  def self.all()
    return @@coven
  end

  def self.sunrise()
    @@coven.delete_if{ |vampire|
        vampire.in_coffin == false || vampire.drank_blood_today == false
      }
  end

  def self.sunset
    @@coven.each { |vampire|
      vampire.in_coffin = false
      vampire.drank_blood_today = false
    }
  end

  #-------------INSTANCE METHODS--------------
  def initialize(name)
    @name = name
    @age = rand(50..300)
    @in_coffin = false
    @drank_blood_today = false
  end

  attr_accessor :in_coffin , :drank_blood_today

  def drink_blood
    @drank_blood_today = true
  end

  def go_home
    @in_coffin = true
  end

end

first = Vampire.create("first")
second = Vampire.create("second")
third = Vampire.create("third")
fourth = Vampire.create("fourth")
puts Vampire.all.inspect

first.drink_blood
first.go_home

second.drink_blood
second.go_home


Vampire.sunrise
puts ' '
puts Vampire.all.inspect

Vampire.sunset
puts ' '
puts Vampire.all.inspect

Vampire.sunrise
puts ' '
puts Vampire.all.inspect
