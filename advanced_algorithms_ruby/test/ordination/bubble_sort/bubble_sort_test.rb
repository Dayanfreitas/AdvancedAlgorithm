require 'test/unit'
require File.join(File.dirname(__FILE__), '..', '..', '..', 'ordination', 'bubble_sort','bubble_sort.rb')
require File.join(File.dirname(__FILE__), '..', '..', '..', 'ultis', 'random_list.rb')

class BubbleSortTest < Test::Unit::TestCase
	def setup
		@array_no_order = RandomList.size(10)
		@array_order = @array_no_order.sort
	end

	def test_sort_type_of_array
		assert_kind_of Array, BubbleSort.sort(@array_no_order), "deve retonar type of array"
	end

	def test_sort
		assert_equal BubbleSort.sort(@array_no_order), @array_order, "deve retornar array ordenado"
	end
end
