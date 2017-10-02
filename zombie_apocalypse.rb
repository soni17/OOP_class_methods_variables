class Zombie

  #--------------CLASS VARIABLES/CONSTANTS--------------
  @@horde = []
  @@plague_level = 10
  MAX_SPEED = 5
  MAX_STRENGTH = 8
  DEFAULT_SPEED = 1
  DEFAULT_STRENGTH = 3

  #--------------CLASS METHODS-----------------
  def self.all()
    return @@horde
  end

  def self.some_die_off()
    @@horde = @@horde.drop(rand(11))
  end

  def self.spawn()
    numb = rand(@@plague_level)
    numb.to_i
    numb.times do |i|
      @@horde << Zombie.new( rand(MAX_SPEED) , rand(MAX_STRENGTH) )
    end

    @@horde
  end

  def self.increase_plague_level()
    number = rand(3)
    number.to_i
    @@plague_level =+ number
  end

  def self.new_day()
    some_die_off
    spawn
    increase_plague_level
  end


  #-----------INSTANCE METHODS-------------
  def initialize(speed,strength)

    if (speed > MAX_SPEED)
      @speed = DEFAULT_SPEED
    else
      @speed = speed
    end

    if (strength > MAX_STRENGTH)
      @strength = DEFAULT_STRENGTH
    else
      @strength = strength
    end

  end

  def encounter()

    if outrun_zombie? == true
      puts "you escaped unscathed"
    elsif outrun_zombie? == false && survive_attack? == false
      puts "you got killed by the zombie"
    elsif outrun_zombie? == false && survive_attack? == true
      puts "you caught the plague and became a zombie yourself"
      @@horde << Zombie.new(@speed, @strength)
    end

  end

  def outrun_zombie?

    my_speed = rand(MAX_SPEED)

    if (my_speed > @speed)
      return true
    else
      return false
    end

  end

  def survive_attack?()

    my_strength = rand(MAX_STRENGTH)

    if (my_strength > @strength)
      return true
    else
      return false
    end

  end

end
