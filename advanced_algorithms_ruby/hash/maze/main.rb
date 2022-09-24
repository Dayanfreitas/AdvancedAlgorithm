require_relative './command/read_file_command.rb'
require_relative './command/memory_file_command.rb'
require_relative './command/invoker_load_file.rb'
require_relative './command/invoker_load_file_memory.rb'

require_relative './maze.rb'
name_file = ARGV[0]

invoker_load_file = InvokerLoadFile.new
invoker_load_file.load_file = ReadFileCommand.new(name_file)
invoker_load_file.init

invoker_load_file_memory = InvokerLoadFileMemory.new
invoker_load_file_memory.load_file_memory = MemoryFileCommand.new(Maze, invoker_load_file.init)
maze = invoker_load_file_memory.init

puts maze 


# maze_arr = Maze.parse_maze(maze_string)
# maze_arr.each { |x| p x }
# p Maze.new(maze_arr).to_hash

