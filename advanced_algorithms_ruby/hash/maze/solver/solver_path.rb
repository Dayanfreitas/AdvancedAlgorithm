
class SolverPath
  attr_reader :path

  def initialize
    @path = []
  end

  def add(x, y)
    path.unshift([x, y])
  end

  def remove
    path.shift
  end
end