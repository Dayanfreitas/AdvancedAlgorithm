require_relative './command.rb'

class MemoryFileCommand < Command
  def initialize(receiver, text)
    @receiver = receiver
    @text = text
  end

  def execute
    puts "execute()[memory file]"
    @receiver_maze = @receiver.new
    @receiver_maze.maze = @receiver.parse_maze(@text)
    @receiver_maze.valid?
    @receiver_maze
    rescue => exception
      puts exception
  end
end