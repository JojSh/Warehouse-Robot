require 'warehouse'

describe Warehouse do

  subject(:warehouse) { described_class.new }

  it 'is initialized as a 10x10 grid' do
    expect(warehouse.grid.length).to eq(10)
    expect(warehouse.grid[0].length).to eq(10)
  end

  describe 'place robot' do
     it 'places robot in top left corner when given co-ords 0x0' do
       warehouse.place_robot(0,0)
       expect(warehouse.grid[0][0]).to eq(1)
     end

     it 'places robot in bottom right corner when coven coords 9x9' do
       warehouse.place_robot(9,9)
       expect(warehouse.grid[9][9]).to eq(1)
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
      warehouse.place_robot(9,0)
      warehouse.move_robot('E')
      expect(warehouse.grid[9][1]).to eq(1)
      expect(warehouse.grid[9][0]).to eq(0)
    end

    it 'moves the robot one square left when given direction W' do
      warehouse.place_robot(0,9)
      warehouse.move_robot('W')
      expect(warehouse.grid[0][9]).to eq(0)
      expect(warehouse.grid[0][8]).to eq(1)
    end

    it 'moves the robot one square up when given direction N' do
      warehouse.place_robot(1,9)
      warehouse.move_robot('N')
      expect(warehouse.grid[1][9]).to eq(0)
      expect(warehouse.grid[0][9]).to eq(1)
    end
  end

end
