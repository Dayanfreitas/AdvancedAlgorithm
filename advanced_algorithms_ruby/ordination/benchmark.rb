require 'benchmark'

require_relative "../ordination/bubble_sort/bubble_sort.rb"
require_relative "../ordination/heapsort/heapsort.rb"
require_relative "./../ultis/random_list.rb"
require_relative "./../ultis/vetor.rb"

list = Vetor.new(RandomList.size(1000))

list_bubble_sort = list.dup
list_heap_sort = list.dup
list_sort = list.dup

# p "BEFORE list_bubble_sort => #{list_bubble_sort}"
# p "BEFORE list_heap_sort => #{list_heap_sort}"
# p "BEFORE list_sort => #{list_sort}"

Benchmark.bmbm do |x|
    x.report("Bubble Sort") { list_bubble_sort = BubbleSort.sort(list_bubble_sort) }
    x.report("Heap Sort") { list_heap_sort = HeapSort.sort(list_heap_sort) }
    x.report("SORT")  { list_sort.sort!  }
end

# puts "==========================================="
# p "AFTER list_bubble_sort => #{list_bubble_sort}"
# p "AFTER list_heap_sort => #{list_heap_sort}"
# p "AFTER list_sort => #{list_sort}"
# puts "==========================================="
