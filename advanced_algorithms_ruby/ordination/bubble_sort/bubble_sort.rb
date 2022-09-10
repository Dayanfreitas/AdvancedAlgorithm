require_relative "./../isort.rb"
require_relative "./../../ultis/vetor.rb"

class BubbleSort < ISort
	
	def self.sort(list)
		new_list = Vetor.new(list).dup
		organize!(new_list)
		new_list
	end
	
	def self.organize!(list)
		for i in (0..list.length - 1)
			for j in ((i + 1)..list.length - 1)
				list.swap!(i, j) if list.is_bigger?(i, j)
			end
		end
	end 
end