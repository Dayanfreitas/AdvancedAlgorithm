require_relative './command.rb'

class ReadFileCommand < Command
  def initialize(name_file)
    @name_file = name_file
  end

  def execute
    puts "execute()[read file #{@name_file}]"
    file = File.open(@name_file)
    txt = file.read
    txt
  end
end