require_relative "code"

class Mastermind
    
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code_1)
        puts @secret_code.num_exact_matches(code_1)
        puts @secret_code.num_near_matches(code_1)
    end

    def ask_user_for_guess
        print "Enter a code"
        guess = gets.chomp
        guessed_code = Code.from_string(guess)
        print_matches(guessed_code)
        @secret_code == guessed_code
    end



end
