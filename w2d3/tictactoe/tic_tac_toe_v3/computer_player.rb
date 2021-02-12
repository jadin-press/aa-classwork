class ComputerPlayer
    attr_reader :mark
    
    def initialize(mark_value)
        @mark = mark_value
    end

    def self.integer_check(character)
        return false if character != "0" && character.to_i == 0
        true
    end
    
    def get_position(legal_positions)
        legal_positions.sample
    end

end