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
      @grid[x][y] = 'R'
    end

    def move_robot(direction)
      x = locate_robot.first
      y = locate_robot.last
      horizontally  = @grid[x]

      if direction == "W"
        horizontally.insert(y-1, horizontally.delete_at(y))
      elsif direction == "N"
        horizontally.map! { |square| square = nil if square == "R" }
        place_robot(x-1, y)
      elsif direction == "S"
        horizontally.map! { |square| square = nil if square == "R" }
        place_robot(x+1, y)
      else
        horizontally.insert(y+1, horizontally.delete_at(y))
      end
    end

    def locate_robot
      co_ords = []
      @grid.each_with_index do |row, index|
        co_ords = [index, row.index('R')] if row.include?('R')
      end
      return co_ords
    end
end
