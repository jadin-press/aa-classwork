require_relative 'piece.rb'
require_relative 'stepable.rb'

class King < Piece
  include Stepable

  def symbol
    "K".colorize(color)
  end

  def move_diffs
    moves
  end

end