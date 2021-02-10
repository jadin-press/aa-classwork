require_relative 'slideable.rb'
require_relative 'piece.rb'

class Queen < Piece
  include Slideable

  def symbol
    "Q".colorize(color)
  end

  private

  def move_dirs
    moves
  end
end