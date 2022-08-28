class ISort 
    def sort! 
        raise "#{self.class} Not implements #{__method__}"
    end
    
    def sort 
        raise "#{self.class} Not implements #{__method__}"
    end
end
