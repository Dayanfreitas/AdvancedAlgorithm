require "./../../ultis/vetor.rb"

vetor = Vetor.new([8,5,6,4,7,9])

puts vetor
vetor.swap!(0, 1)
p vetor