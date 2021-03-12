require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :previous_move_pos
  
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @previous_move_pos = prev_move_pos if prev_move_pos
    # @previous_move_pos = prev_move_pos
  end

  # def losing_node?(evaluator)
  #   @board.over? && winner
  # end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children_arr = []
    @board.rows.each_index do |i|
      @board.rows.each_index do |j|
        if @board.empty?([i, j])
          children_arr << TicTacToeNode.new(@board.dup, @next_mover_mark, @board[i, j])
        end
      end
    end
    children_arr
  end
end
