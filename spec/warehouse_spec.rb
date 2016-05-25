require 'warehouse'

describe Warehouse do

  it 'is initialized as a 10x10 grid' do
    warehouse = Warehouse.new
    expect(warehouse.grid.length).to eq(10)
    expect(warehouse.grid[0].length).to eq(10)    
  end

end
