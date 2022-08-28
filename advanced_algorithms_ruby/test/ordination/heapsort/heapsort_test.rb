require 'test/unit'
require File.join(File.dirname(__FILE__), '..', '..', '..', 'ordination', 'heapsort','heapsort.rb')
require File.join(File.dirname(__FILE__), '..', '..', '..', 'ultis', 'random_list.rb')

class HeapSortTest < Test::Unit::TestCase
	def setup
		# @array_no_order = RandomList.size(10)
		# @array_order = @array_no_order.sort
	end

	def test_sort_heapsort
        assert_equal true, false
		# assert_kind_of Array, BubbleSort.sort(@array_no_order), "deve retonar type of array"
	end
end
