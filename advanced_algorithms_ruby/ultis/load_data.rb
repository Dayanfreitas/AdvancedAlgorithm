require 'csv'

module Data
	TRACK_NAME = 0
	def self.load_tik_tok
		file = File.join(File.dirname(__FILE__), '..', '..', 'data', 'tik_tok_songs_2019.csv')
		list = []
		CSV.foreach(File.open(file)) do |row|
			list << row[TRACK_NAME]
		end
		list
	end 
end

