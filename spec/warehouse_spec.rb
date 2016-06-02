require 'warehouse'
require 'pry'

describe Warehouse do

  subject(:warehouse) { described_class.new }

  it 'is initialized as a 10x10 grid' do
    expect(warehouse.grid.length).to eq(10)
    expect(warehouse.grid[0].length).to eq(10)
  end

  describe 'place robot' do
     it 'places robot in top left corner when given co-ords 0x0' do
       warehouse.place_robot(0,0)
       expect(warehouse.grid[0][0]).to eq('R')
     end

     it 'places robot in bottom right corner when coven coords 9x9' do
       warehouse.place_robot(9,9)
       expect(warehouse.grid[9][9]).to eq('R')
     end
  end

  describe 'locate robot' do
    it 'returns the current coordinates of the robot' do
      warehouse.place_robot(5,3)
      expect(warehouse.locate_robot).to eq([5, 3])
    end
  end

  describe 'move robot' do
    it 'moves the robot one square right when given direction E' do
      warehouse.place_robot(0,4)
      warehouse.move_robot('E')
      expect(warehouse.grid[0][5]).to eq('R')
      expect(warehouse.grid[0][4]).to eq(nil)
    end

    it 'moves the robot one square left when given direction W' do
      warehouse.place_robot(0,4)
      warehouse.move_robot('W')
      expect(warehouse.grid[0][3]).to eq('R')
      expect(warehouse.grid[0][4]).to eq(nil)
    end

    it 'moves the robot one square up when given direction N' do
      warehouse.place_robot(4,0)
      warehouse.move_robot('N')
      expect(warehouse.grid[3][0]).to eq('R')
      expect(warehouse.grid[4][0]).to eq(nil)
    end

    it 'moves the robot one square down when given direction S' do
      warehouse.place_robot(4,0)
      warehouse.move_robot('S')
      expect(warehouse.grid[5][0]).to eq('R')
      expect(warehouse.grid[4][0]).to eq(nil)
    end

    it 'moves the robot one square down when given direction S' do
      warehouse.place_robot(9,0)
      warehouse.move_robot('W')
      expect(warehouse.grid[9][0]).to eq('R')
    end
  end

  describe 'program_sequence' do
    it 'gives the robot commands to move in a complete circle' do
      warehouse.place_robot(9,0)
      warehouse.program_sequence("N E S W")
      expect(warehouse.grid[9][0]).to eq('R')
    end

    it 'gives robot series of commands to reach center of grid from SW corner' do
      warehouse.place_robot(9,0)
      warehouse.program_sequence("N E N E N E N E")
      expect(warehouse.grid[5][4]).to eq('R')
    end

    it 'gives robot series of commands to reach center of grid from NE corner' do
      warehouse.place_robot(0,9)
      warehouse.program_sequence("S W S W S W S W")
      expect(warehouse.grid[4][5]).to eq('R')
    end
  end

end
