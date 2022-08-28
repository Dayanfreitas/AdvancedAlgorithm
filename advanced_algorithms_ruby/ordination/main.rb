require 'benchmark'

require_relative "../ordination/bubble_sort/bubble_sort.rb"
require_relative "./../ultis/random_list.rb"
require_relative "./../ultis/vetor.rb"

list = Vetor.new(RandomList.size(5))

list_bubble_sort = list.dup
list_sort = list.dup

p "BEFORE list_bubble_sort => #{list_bubble_sort}"
p "BEFORE list_sort => #{list_sort}"

def bubble_sort(list)
    BubbleSort.sort(list)
end

Benchmark.bmbm do |x|
    x.report("Bubble Sort") { bubble_sort(list_bubble_sort) }
    x.report("SORT")  { list_sort.sort!  }
end
p "AFTER list_bubble_sort => #{list_bubble_sort}"
p "AFTER list_sort => #{list_sort}"
