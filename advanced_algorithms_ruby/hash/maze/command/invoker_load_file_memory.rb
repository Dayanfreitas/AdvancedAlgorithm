class InvokerLoadFileMemory

  def load_file_memory=(command)
    @load_file_memory = command
  end

  def init
    puts "Read file memory"
    @load_file_memory.execute if @load_file_memory.is_a? Command
  end
end