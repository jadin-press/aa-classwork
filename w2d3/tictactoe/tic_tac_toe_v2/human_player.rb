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
    
    def get_position
        puts "Enter position as two numbers with a space between them (ex. '1 2')"
        entered_position = gets.chomp
        if entered_position.length != 3 || !HumanPlayer.integer_check(entered_position[0]) || entered_position[1] != " " || !HumanPlayer.integer_check(entered_position[2])
            raise "invalid position"
        else 
            return [entered_position[0].to_i, entered_position[2].to_i]
        end
    end
end