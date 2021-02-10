require_relative 'slideable.rb'
require_relative 'piece.rb'

class Rook < Piece
  include Slideable

  def symbol
    "R".colorize(color)
  end

  private

  def move_dirs
    moves
  end
end