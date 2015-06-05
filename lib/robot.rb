class Robot
  MAX_CAPACITY = 250
  MAX_HEALTH = 100
  MIN_HEALTH = 0
  WEAK_ATTACK = 5
  attr_reader :items, :position, :health
  attr_accessor :equipped_weapon
  def initialize
    @items = []
    @position = [0, 0]
    @health = MAX_HEALTH
    @equipped_weapon = nil
  end
  

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
    @health -= dmg
    @health = MIN_HEALTH if health < MIN_HEALTH # or @health = [@health, MIN_HEALTH].max
    @equipped_weapon = item if item.is_a? Weapon
  end

  def heal(power)
    @health += power
    @health = [@health, MAX_HEALTH].min # or  @health = MAX_HEALTH if health > MAX_HEALTH
  end

  def heal!(power)
    if @heath == 0 
       raise RuntimeError
     else
      @health += power
      @health = [@health, MAX_HEALTH].min # or  @health = MAX_HEALTH if health > MAX_HEALTH
    end 
  end

  def attack(enemy)
    if @equipped_weapon
     @equipped_weapon.hit(enemy)
    else
      enemy.wound(WEAK_ATTACK)
    end
  end


  def attack!(enemy)
    unless enemy.is_a? Robot
      raise RuntimeError
    else
      if @equipped_weapon
       @equipped_weapon.hit(enemy)
      else
        enemy.wound(WEAK_ATTACK)
      end
    end
  end


end

  # def equipped_weapon=(weapon)
  #   @equipped_weapon = weapon
    
  # end



