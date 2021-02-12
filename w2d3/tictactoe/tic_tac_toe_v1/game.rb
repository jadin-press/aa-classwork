require "byebug"
require_relative "board.rb"
require_relative "human_player.rb"

class Game
    attr_accessor = :player_1, :player_2, :current_player, :board
    
    def initialize(player_1_mark, player_2_mark)
        @player_1, @player_2 = HumanPlayer.new(player_1_mark), HumanPlayer.new(player_2_mark)
        @current_player = @player_1
        @board = Board.new
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
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