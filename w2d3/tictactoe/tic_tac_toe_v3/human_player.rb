require "byebug"

class HumanPlayer
    attr_reader :mark
    
    def initialize(mark_value)
        @mark = mark_value
    end

    def self.integer_check(character)
        return false if character != "0" && character.to_i == 0
        true
    end
    
    def get_position(legal_positions)
        entered_position = 0
        puts "Enter position as two numbers with a space between them (ex. '1 2')"
        while !legal_positions.include?(entered_position)
            entered_position = gets.chomp
            entered_position = entered_position.split(" ").map { |el| el.to_i }
            if !legal_positions.include?(entered_position)
                puts "That choice is illegal. Please enter a different position"
            end
        end
        
        entered_position
    end
end