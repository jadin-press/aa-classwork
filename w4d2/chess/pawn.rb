require_relative 'piece.rb'

class Pawn < Piece

  def symbol
    "P".colorize(color)
  end

end