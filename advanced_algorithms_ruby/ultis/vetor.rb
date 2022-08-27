class Vetor < Array
  def swap!(a, b)
    self[a],self[b] = self[b],self[a]
    self
  end
end
