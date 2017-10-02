class Vampire

  #-------------CLASS VARIABLES-----------------
  @@coven = []

  #---------------CLASS METHODS---------------
  def self.create(name,age)
    @@coven << Vampire.new(name,age)
  end

  def self.all
    @@coven
  end

  def self.sunrise
    newlist = @@coven.select{ |item| item.in_coffin == false || item.drank_blood_today == false }
    @@coven = newlist
  end

  def self.sunset
    @@coven.each do |obj|
      obj.in_coffin = false
      obj.drank_blood_today = false
    end
  end

  #-------------INSTANCE METHODS--------------
  def initialize(name,age)
    @name = name
    @age = age
    @in_coffin = true
    @drank_blood_today = true
  end

  def drink_blood
    @drank_blood_today = true
  end

  def go_home
    @in_coffin = true
  end

end
