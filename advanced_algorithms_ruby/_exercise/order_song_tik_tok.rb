require_relative './../ordination/heapsort/heapsort.rb'
require_relative './../ultis/load_data.rb'
require 'benchmark'

Benchmark.bmbm do |x|
  x.report("Heap Sort") { HeapSort.sort(Data.load_tik_tok) }
  x.report("SORT")  { Data.load_tik_tok.sort  }
end