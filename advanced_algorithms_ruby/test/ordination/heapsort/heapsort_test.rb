require 'test/unit'
require File.join(File.dirname(__FILE__), '..', '..', '..', 'ordination', 'heapsort','heapsort.rb')
require File.join(File.dirname(__FILE__), '..', '..', '..', 'ultis', 'random_list.rb')

class HeapSortTest < Test::Unit::TestCase
	def setup
		@arr = [3, 0, 2, 5, -1, 4, 1]
		@array_order = @arr.sort
	end

	def test_sort_heapsort
        assert_equal HeapSort.sort(@arr), @array_order 
	end
end
