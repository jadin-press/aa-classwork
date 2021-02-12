class GuessingGame

    attr_accessor :num_attempts, :secret_num

    def initialize(min, max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        self.num_attempts += 1
        if num == self.secret_num
            @game_over = true
            puts "you win"
        elsif num > self.secret_num
            puts "too big"
        else
            puts "too small"
        end
    end

    def ask_user
        puts "enter a number"
        num_input = gets.chomp.to_i
        check_num(num_input)
    end
end
