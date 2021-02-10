require_relative 'piece.rb'

class King < Piece

  def symbol
    "K".colorize(color)
  end

end