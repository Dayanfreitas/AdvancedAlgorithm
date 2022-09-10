class ISort
    def self.sort 
        raise "#{self.class} Not implements #{__method__}"
    end
end
