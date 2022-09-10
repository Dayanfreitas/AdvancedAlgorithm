module RandomList
    def self.size(size=5)
        (0..size).map { Random.new.rand(size) }
    end
end


