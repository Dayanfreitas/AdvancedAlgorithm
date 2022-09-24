require 'test/unit'
require File.join(File.dirname(__FILE__), '..', '..', '..', 'hash', 'maze', 'maze.rb')

class MazeTest < Test::Unit::TestCase
	
	def test_make_maze_valid
		maze_arr = [
			[Maze::START, Maze::FLOOR, Maze::FLOOR, Maze::EXIT],
		]
		maze = Maze.new
		maze.maze = maze_arr
		assert_equal true, maze.valid?, "Labirinto deve ser válido" 
	end
	
	def test_make_maze_valid_with_draw
		maze_arr = [
			[Maze::WALL, Maze::WALL, Maze::WALL, Maze::WALL],
			[Maze::START, Maze::FLOOR, Maze::FLOOR, Maze::EXIT],
			[Maze::WALL, Maze::WALL, Maze::WALL, Maze::WALL],
		]
		maze = Maze.new
		maze.maze = maze_arr
		assert_equal true, maze.valid?, "Labirinto deve ser válido" 
	end

	def test_make_maze_invalid
		assert_raises StandardError do
			maze_arr = [
				[Maze::WALL, Maze::WALL, Maze::WALL, Maze::WALL],
				[Maze::WALL, Maze::FLOOR, Maze::FLOOR, Maze::WALL],
				[Maze::WALL, Maze::WALL, Maze::WALL, Maze::WALL],
			]
			maze = Maze.new
			maze.maze = maze_arr
			maze.valid?
		end
	end

	def test_maze_contants
		assert_equal Maze::WALL, "#", "Deve retornar parede"
		assert_equal Maze::FLOOR, ".", "Deve retornar chão"
		assert_equal Maze::START, "S", "Deve retornar inicio"
		assert_equal Maze::EXIT, "E", "Deve retornar fim"
	end
end
