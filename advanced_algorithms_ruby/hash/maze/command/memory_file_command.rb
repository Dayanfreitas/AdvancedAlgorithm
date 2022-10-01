require_relative './command.rb'

class MemoryFileCommand < Command
  def initialize(receiver, text)
    @receiver = receiver
    @text = text
  end

  def execute
    puts "execute()[memory file]"
    @receiver_maze = @receiver.new
    tubles_maze = @receiver.parse_maze(@text)
    @receiver_maze.text = @text 
    @receiver_maze.maze = tubles_maze[:maze_lines] 
    @receiver_maze.starting_point = tubles_maze[:starting_point]
    @receiver_maze.exit_point = tubles_maze[:exit_point]
    @receiver_maze.valid?
    @receiver_maze       
    rescue => exception
      puts exception
      exit
  end
end