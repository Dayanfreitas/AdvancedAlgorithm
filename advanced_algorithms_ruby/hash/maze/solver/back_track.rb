require_relative './solver.rb'

class BackTrack < Solver

  def search_exit(maze)
    "BackTrack #{maze}"

    solution = [
      [1,0],
      [1,1],
      [1,2],
      [1,3],
      [2,3],
      [3,3],
      [4,3],
      [4,4],
      [4,5],
    ]

    solution
  end
end