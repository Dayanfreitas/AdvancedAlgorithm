require 'json'
require 'digest'
require_relative './../../../initialize/01-initilize-redis.rb'
class SolverMazeContext
  
  def set_strategy(strategy)
    @strategy = strategy
  end

  def solver(maze)    
    arr_solution = solution_in_redis(maze)
    return arr_solution if have_solution?(arr_solution)
    
    arr_solution = strategy.search_exit(maze) if !have_solution?(arr_solution)    
    set_solution_in_redis(maze, arr_solution)
    arr_solution
  end

  private

  def solution_in_redis(maze)
    key = key_solution_in_redis(maze)
    JSON.parse(redis.get(key) || '[]')
  end

  def set_solution_in_redis(maze, solution)
    key = key_solution_in_redis(maze)
    redis.set(key, solution)
  end

  def key_solution_in_redis(maze)
    md5 = Digest::MD5.new
    md5 << maze.text
    md5 << self.strategy.class.to_s
    md5.to_s
  end

  def have_solution?(solution_arr)
    !solution_arr.empty?
  end

  def strategy
    @strategy
  end

  def redis
    @redis = ConnectionRedis.instance
  end
end