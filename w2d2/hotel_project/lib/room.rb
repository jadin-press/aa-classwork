class Room

    attr_reader :capacity
    attr_accessor :occupants

    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def full?
        self.capacity == self.occupants.length
    end

    def available_space
        self.capacity - self.occupants.length
    end

    def add_occupant(name)
        if !full?
            self.occupants << name
            return true
        else
            return false
        end
    end


end
