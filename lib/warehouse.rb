class Warehouse

  attr_reader :grid

  def initialize
    @grid = [[0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0]]
    end


    def place_robot(x, y)
      @grid[x][y] = 1
    end

    def move_robot(direction)
      x = locate_robot[0]
      y = locate_robot[1]
      row = @grid[x]
      if direction == "W"
        row.insert(y-1, row.delete_at(y))
      else
        row.insert(y+1, row.delete_at(y))
      end
    end

    def locate_robot
      co_ords = []
      @grid.each_with_index do | row , index |
        if row.include?(1)
          co_ords = [index, row.index(1)]
        end
      end
      return co_ords
    end

end
