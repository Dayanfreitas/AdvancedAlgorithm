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
    
    _count_start = 0
    _count_exit = 0

    @maze.each { |line|
      line.each { |column|
        caracter = _PERMIT.each.find{|x| x == column.bytes }
        raise StandardError.new "Maze is not valid" if caracter.nil?
        _count_start += 1 if caracter == START.bytes
        _count_exit += 1 if caracter == EXIT.bytes
      }
    }
    raise StandardError.new "Maze is not valid" if _count_start == 0
    raise StandardError.new "Maze is not valid" if _count_exit == 0 

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
