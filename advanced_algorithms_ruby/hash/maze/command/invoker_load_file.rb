class InvokerLoadFile
  def load_file=(command)
    @load_file = command
  end
  
  def init
    if @load_file.is_a? Command
      puts "Read file"
      file = @load_file.execute
    end
    puts file

    file
  end
end