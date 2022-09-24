class Maze
  WALL = "#"
  FLOOR = "."
  START = "S"
  EXIT = "E"

  PERMIT = [ WALL, FLOOR, START, EXIT ].freeze
  
  def maze=(maze)
    @maze = maze
  end
  
  def maze
    @maze
  end

  def to_hash
    @maze.each {|x|  
      x.each{|s|
        p s.bytes
      }
    }
  end

  def valid?
    _PERMIT = PERMIT.map(&:bytes)

    @maze.each { |line|
      line.each { |column|
        is_valid = _PERMIT.each.find{|x| x == column.bytes }
        raise "Maze is not valid" unless is_valid
      }
    }

    true
  end

  def self.parse_maze(string)
    string
    maze_lines = string.split("\n").map {|x| 
      x.split //
    }

    maze_lines
  end
end
