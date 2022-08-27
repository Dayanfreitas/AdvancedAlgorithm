require_relative "./../ultis/random_list.rb"
require_relative "./../ultis/vetor.rb"
require 'benchmark'

list = Vetor.new(RandomList.size(100))

list_bubble_sort = list.dup
list_sort = list.dup

p "BEFORE list_bubble_sort => #{list_bubble_sort}"
p "BEFORE list_sort => #{list_sort}"

Benchmark.bmbm do |x|
    x.report("Bubble Sort") { 
        for i in (0..list_bubble_sort.length - 1)
            for j in ((i + 1)..list_bubble_sort.length - 1)
                list_bubble_sort.swap!(i, j) if list_bubble_sort.is_bigger?(i, j)
            end
        end
     }
    x.report("SORT")  { list_sort.sort!  }
end
p "AFTER list_bubble_sort => #{list_bubble_sort}"
p "AFTER list_sort => #{list_sort}"
