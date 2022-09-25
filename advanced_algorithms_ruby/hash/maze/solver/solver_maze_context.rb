class SolverMazeContext
  
  def set_strategy(strategy)
    @strategy = strategy
  end

  def solver(maze)
    strategy.search_exit(maze)
  end

  private

  def strategy
    @strategy
  end
end