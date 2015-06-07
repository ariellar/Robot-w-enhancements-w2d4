class Robot
  MAX_CAPACITY = 250
  MAX_HEALTH = 100
  MIN_HEALTH = 0
  WEAK_ATTACK = 5
  LIMIT_ON_AUTO_FEED = 80
  MAX_SHIELD = 50
  MIN_SHIELD = 0
  attr_reader :items, :position, :health, :shield_points
  attr_accessor :equipped_weapon
  def initialize
    @items = []
    @position = [0, 0]
    @health = MAX_HEALTH
    @shield_points = MAX_SHIELD
    @equipped_weapon = nil
    @x_range = (position[0] + 1 .. position[0] - 1)
    @y_range = (position[1] - 1..position[1] + 1)
  end
  
  # could compile all moves into an array and then check if any of them include the enemy

  def move_left
    @position -= 1
  end

  def move_right
    @position += 1
  end

  def move_up
    @position += 1
  end

  def move_down
    @position -= 1
  end


  def pick_up(item)
    item.feed(self) if item.is_a?(BoxOfBolts) && health <= LIMIT_ON_AUTO_FEED
    unless item.weight + items_weight > MAX_CAPACITY
      @equipped_weapon = item if item.is_a? Weapon
      @items << item 
    end  
  end




  def items_weight
    # total_weight = 0
    # @items.each do |item|
    #   total_weight = total_weight + item_weight
    # end
    # total_weight
    @items.inject(0){|sum, item| sum + item.weight}
  end

  def wound(dmg)
    unless shield_points <= MIN_SHIELD
      @shield_points -= dmg
    else
      @health -= dmg
      @health = MIN_HEALTH if health < MIN_HEALTH # or @health = [@health, MIN_HEALTH].max
      @equipped_weapon = item if item.is_a? Weapon
    end
  end
  
  def heal!(power)
    if @heath == 0 
       raise RuntimeError
     else
      @health += power
      @health = [@health, MAX_HEALTH].min # or  @health = MAX_HEALTH if health > MAX_HEALTH
    end 
  end

  def heal(power)
    @health += power
    @health = MAX_HEALTH if health > MAX_HEALTH  # or = [@health, MAX_HEALTH].min 
  end


  def attack!(enemy)
    unless enemy.is_a? Robot
      raise RuntimeError
    else
      Robot.attack(enemy)
    end
  end

  def attack(enemy)
    # if nearby?(enemy)
      if @equipped_weapon
       @equipped_weapon.hit(enemy)
      else
        enemy.wound(WEAK_ATTACK)
      end
    # end
  end


  # def nearby?(enemy)
  #   enemy.wound(WEAK_ATTACK) if (enemy.position[0] - position[0]).abs <= 1 && (enemy.position[1] - position[1]).abs <= 1
  # end

  # def nearby?(enemy)
  #   x_range = (position[0] + 1 .. position[0] - 1)
  #   y_range = (position[1] + 1 .. position[1] - 1)
  #   if x_range.include?(enemy.position[0]) && y_range.include?(enemy.position[1])
  #     true
  #   else
  #     false
  #   end
  # end




  # def nearby?(enemy)
  #   x_coord_range = (position[0]-1..position[0]+1)
  #   y_coord_range = (position[1]-1..position[1]+1)

  #   if (x_coord_range.include?(enemy.position[0]) && y_coord_range.include?(enemy.position[1]))
  #     true
  #   else
  #     false
  #   end
  # end
end








