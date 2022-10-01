class Position
  attr_reader :x, :y, :caracter

  def initialize(x, y, caracter)
    @x = x
    @y = y
    @caracter = caracter
  end

  def x=(x)
    @x = x
  end
  def y=(y)
    @y = y
  end
  def caracter=(caracter)
    @caracter = caracter
  end
end

class Wall < Position 
  def initialize(x, y, caracter)
    super(x, y, caracter)
  end
end
class Floor < Position
  def initialize(x, y, caracter)
    super(x, y, caracter)
  end
end
class Start < Position
  def initialize(x, y, caracter)
    super(x, y, caracter)
  end
end
class Exit < Position 
  def initialize(x, y, caracter)
    super(x, y, caracter)
  end
end
class Solve < Position 
  def initialize(x, y)
    super(x, y, Maze::SOLVER)
  end
end

class Trail < Position
  def initialize(x, y)
    super(x, y, Maze::TRAIL)
  end
end

class Animation < Position
  def initialize(x, y)
    super(x, y, Maze::ANIMATION)
  end
end

class Maze
  WALL = "#"
  FLOOR = "."
  START = "S"
  EXIT = "E"
  TRAIL = "-"
  SOLVER = "@"
  ANIMATION = "*"

  PERMIT = [ WALL, FLOOR, START, EXIT ].freeze
  
  def maze=(maze)
    @maze = maze
  end
  
  def maze
    @maze
  end

  def starting_point=(starting_point)
    @starting_point = starting_point
  end
  
  def starting_point
    @starting_point
  end

  def exit_point=(exit_point)
    @exit_point = exit_point
  end
  
  def exit_point
    @exit_point
  end

  def text=(text)
    @text = text
  end

  def text
    @text
  end

  def valid?
    _PERMIT = PERMIT.map(&:bytes)
    
    _count_start = 0
    _count_exit = 0

    @maze.each { |line|
      line.each { |column|
        caracter = _PERMIT.each.find{|x| x == column.caracter.bytes }
        raise StandardError.new "Maze is not valid" if caracter.nil?
        _count_start += 1 if caracter == START.bytes
        _count_exit += 1 if caracter == EXIT.bytes
      }
    }
    raise StandardError.new "Maze is not valid" if _count_start == 0
    raise StandardError.new "Maze is not valid" if _count_exit == 0 

    true
  end

  def self.draw(maze)
    maze.maze.each { |line|
      puts line.map(&:caracter).join
    }
  end

  def self.parse_maze(string)
    starting_point = []
    exit_point = []

    maze_lines = string.split("\n").map.with_index { |line, line_index|
      line_split = line.split //
      line_split.map.with_index { |caracter, column_index|
        case caracter
        when WALL
          position = Wall.new(line_index, column_index, WALL)
        when FLOOR
          position = Floor.new(line_index, column_index, FLOOR)
        when START
          position = Start.new(line_index, column_index, START)
          starting_point.push(position)
        when EXIT
          position = Exit.new(line_index, column_index, EXIT)
          exit_point.push(position)
        end

        position
      }
    }
   
    {maze_lines: maze_lines, starting_point: starting_point, exit_point: exit_point} 
  end
end
