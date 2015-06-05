class BoxOfBolts < Item
  HEAL_VAL = 20
  def initialize
    super('Box of bolts', 25)
  end


  def feed(robot)
    robot.heal(HEAL_VAL)    
  end

end