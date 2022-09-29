require_relative './command/read_file_command.rb'
require_relative './command/memory_file_command.rb'
require_relative './command/invoker_load_file.rb'
require_relative './command/invoker_load_file_memory.rb'

require_relative './solver/solver_maze_context.rb'
require_relative './solver/back_track.rb'
require_relative './solver/recursive_algorithm.rb'

require_relative './maze.rb'

BACKTRACK = "BACKTRACK"
RECURSIVE_ALGORITHM = 'RECURSIVE_ALGORITHM'

name_file = ARGV[0]
strategy = RECURSIVE_ALGORITHM

raise "Expected file name as parameter" unless name_file

invoker_load_file = InvokerLoadFile.new
invoker_load_file.load_file = ReadFileCommand.new(name_file)
maze_file = invoker_load_file.init

invoker_load_file_memory = InvokerLoadFileMemory.new
invoker_load_file_memory.load_file_memory = MemoryFileCommand.new(Maze, maze_file)
maze_object = invoker_load_file_memory.init

solver_context = SolverMazeContext.new
solver_context.set_strategy(BackTrack.new) if strategy.eql?(BACKTRACK)
solver_context.set_strategy(RecursiveAlgorithm.new) if strategy.eql?(RECURSIVE_ALGORITHM)
solution = solver_context.solver(maze_object)

# animation solution
solution.each do |position|
  x, y = position
  system('clear')
  maze_object.maze[x][y] = Animation.new(x, y)
  Maze.draw(maze_object)
  sleep 0.5
end