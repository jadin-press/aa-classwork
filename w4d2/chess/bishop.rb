require_relative 'slideable.rb'
require_relative 'piece.rb'

class Bishop < Piece
  include Slideable

  def symbol
    "B".colorize(color)
  end

  private

  def move_dirs
    moves
  end
end