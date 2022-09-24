require 'test/unit'
# require File.join(File.dirname(__FILE__), '..', '..', '..', 'ordination', 'bubble_sort','bubble_sort.rb')
require File.join(File.dirname(__FILE__), '..', '..', '..', 'hash', 'maze', 'maze.rb')

class MazeTest < Test::Unit::TestCase
	# def setup
	# 	@array_no_order = RandomList.size(10)
	# 	@array_order = @array_no_order.sort
	# end

	# def test_sort_type_of_array
	# 	assert_kind_of Array, BubbleSort.sort(@array_no_order), "deve retonar type of array"
	# end

	def test_maze_contants
		assert_equal Maze::WALL, "#", "Deve retornar parede"
		assert_equal Maze::FLOOR, ".", "Deve retornar chão"
		assert_equal Maze::START, "S", "Deve retornar inicio"
		assert_equal Maze::EXIT, "E", "Deve retornar fim"
	end
end
