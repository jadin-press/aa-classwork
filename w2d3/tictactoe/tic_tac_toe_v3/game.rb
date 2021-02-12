require "byebug"
require_relative "board.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Game
    attr_accessor = :players, :current_player, :board
    
    def initialize(board_size, player_marks = {})
        @players = []
        player_marks.keys.map do |mark|
            if player_marks[mark]
                @players << ComputerPlayer.new(mark)
            else
                @players << HumanPlayer.new(mark)
            end
        end
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
            move = @current_player.get_position(@board.legal_positions)
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