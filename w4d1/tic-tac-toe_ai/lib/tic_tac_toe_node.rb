require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    @board.over? && winner
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    @board.each_index do |i|
      @board.each_index do |j|
        if @board.empty?([i, j])
          TicTacToeNode.new(@board.dup, @next_mover_mark, @board[i, j])
          @previous_move_pos = @board[i, j]
        end
      end
    end
  end
end