require_relative 'spec_helper'

# Robots can start with 50 shield points. 
# When robot is damaged, 1st drains shield, 
# then starts affecting actual health.

describe Robot do 

  before :each do 
    @robot = Robot.new
  end

  describe "#shield_points" do
    it "starts off with 50 shield points" do
      expect(@robot.shield_points).to eq(50)
    end

    it "when robot is attacked, wound drains shield points, not health" do
      @robot.wound(30)
      expect(@robot.shield_points).to eq(20)
    end

    it "when shield points are <= 0, the robot's health decreases when wounded, not the shield" do
      @robot.health = 100
      @robot.wound(20)
      @robot.shield_points = 10
      expect(@robot.health).to eq(90)
    end

  end
end

