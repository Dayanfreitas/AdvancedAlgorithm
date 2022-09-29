require_relative './solver.rb'
require_relative './solver_path.rb'
require 'byebug'

class RecursiveAlgorithm < Solver
  def search_exit(maze_class)
    starting_point = maze_class.starting_point.first 
    x = starting_point.x
    y = starting_point.y
    
    recursive_algorithm_solver = RecursiveAlgorithmSolver.new(maze_class.maze, [x, y])
    recursive_algorithm_solver.solve_maze
    recursive_algorithm_solver.solver_path.path
  end
end

# Recursive Algorithm baseaded:
# https://github.com/AlexAvlonitis/the_maze/blob/master/lib/recursive_algorithm.rb
#
class RecursiveAlgorithmSolver
  
  def initialize(maze_array, find_starting_point_coords)
    @maze_array = maze_array
    @starting_point = find_starting_point_coords
  end

  def solve_maze(h = starting_point[0], w = starting_point[1])
    return false if check_maze_boundaries(h, w)
    if goal_reached?(h, w)
      return true
    end
    return false if blocked_path?(h, w)

    leave_trail(h, w)

    # recursions until goal or dead end
    if solve_maze(h - 1, w) # go up
      mark_valid_path(h, w)
      return true
    end
    if solve_maze(h + 1, w) # go down
      mark_valid_path(h, w)
      return true
    end
    if solve_maze(h, w - 1) # go right
      mark_valid_path(h, w)
      return true
    end
    if solve_maze(h, w + 1) # go left
      mark_valid_path(h, w)
      return true
    end
    return false
  end

  def solver_path
    @solver_path ||= SolverPath.new
  end

  private
  attr_reader :maze_array, :starting_point

  def check_maze_boundaries(h, w)
    !!(w < 0 || h < 0 || h > maze_height || w > maze_width)
  end

  def maze_height
    maze_array.size - 1
  end

  def maze_width
    maze_array[0].size - 1
  end

  def goal_reached?(h, w)
    !!(maze_array[h][w].caracter == Maze::EXIT)
  end

  def blocked_path?(h, w)
    !!(maze_array[h][w].caracter == Maze::WALL || maze_array[h][w].caracter == Maze::TRAIL)
  end

  def leave_trail(h, w)
    maze_array[h][w] = Trail.new(h, w)
  end

  def mark_valid_path(h, w)
    maze_array[h][w] = Solve.new(h, w)
    solver_path.add(h, w)
  end
end
