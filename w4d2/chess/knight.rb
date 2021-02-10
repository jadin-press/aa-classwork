require_relative 'piece.rb'
require_relative 'stepable.rb'

class Knight < Piece
  include Stepable
  
  def symbol
    "H".colorize(color)
  end

  def move_diffs
    moves
  end

end