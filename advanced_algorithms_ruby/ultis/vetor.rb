class Vetor < Array
  def initialize(args)
    @total_swaps = 0 
    super(args)   
  end

  def total_swaps
    @total_swaps
  end

  def swap!(a, b)
    @total_swaps += 1
    self[a],self[b] = self[b],self[a]
    self
  end

  def is_bigger?(value_a, value_b)
    self[value_a] > self[value_b]
  end
end
