require "byebug"
require_relative "board.rb"
require_relative "human_player.rb"

class Game
    attr_accessor = :players, :current_player, :board
    
    def initialize(board_size, *player_marks)
        @players = player_marks.map { |mark| HumanPlayer.new(mark) }
        # @player_1, @player_2 = HumanPlayer.new(player_1_mark), HumanPlayer.new(player_2_mark)
        @current_player = @players[0]
        @board = Board.new(board_size)
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
    end

    def play
        while @board.empty_positions?
            @board.print
            move = @current_player.get_position
            @board.place_mark(move, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "#{@current_player.mark} wins!"
                return
            else
                switch_turn
            end
        end
        puts "Draw"
    end
end