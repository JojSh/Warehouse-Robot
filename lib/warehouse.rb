class Warehouse

  attr_reader :grid

  def initialize
    @grid  = [[nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],
              [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],
              [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],
              [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],
              [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],
              [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],
              [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],
              [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],
              [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],
              [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]]
  end


  def place_robot(x, y)
    grid[x][y] = 'R'
  end

  def move_robot(direction)
    if direction == "W" || direction == "E"
      move_horizontally(direction)
    else
      move_vertically(direction)
    end
  end

  def locate_robot
    co_ords = []
    grid.each_with_index { |row, index|
      co_ords = [index, row.index('R')] if row.include?('R') }
    return co_ords
  end

  def program_sequence(sequence)
    split = sequence.split(" ")
    split.each { | direction |
      move_robot(direction) }
  end

  private

  def move_vertically(direction)
    x = locate_robot.first
    y = locate_robot.last

    grid[x].map! { |square| square = nil if square == "R" }
    direction == "N" ? place_robot(x-1, y) : place_robot(x+1, y)
  end

  def move_horizontally(direction)
    x = locate_robot.first
    y = locate_robot.last

    direction == "W" ? grid[x].insert(y-1, grid[x].delete_at(y)) : grid[x].insert(y+1, grid[x].delete_at(y))
  end


end
