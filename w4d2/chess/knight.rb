require_relative 'piece.rb'

class Knight < Piece

  def symbol
    "H".colorize(color)
  end

end