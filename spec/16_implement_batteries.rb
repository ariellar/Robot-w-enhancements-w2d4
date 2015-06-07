require_relative 'spec_helper'

# Batteries, items, recharge robots shield. 
# Implement Battery item that can be used to recharge the Robot’s shield. 
# Batteries have a weight of 25.

describe Battery do 
  before :each do 
    @battery = Battery.new("Battery", 25)
  end

  describe "#initialize" do 
    
    it "should be an item" do
      expect(@battery).to be_an(Item)
    end

    it "should initialize name 'Battery'" do
      expect(@battery.name).to eq("Battery")
    end

    it "should initialize weight 25" do
      expect(@battery.weight).to eq(25)
    end
  end

  describe "#charge" do

    it "charges/ increases robot's shield points" do
      @robot = Robot.new
      @robot.shield_points = 50








  describe "#recharge" do

    it "recharge robot instance" do
      @robot = Robot.new
      allow(@robot).to receive(:shield).and_return(20)
      expect(@battery.recharge(@robot)).to eq(50)
    end
  end


  