class Piece
  attr_reader :color, :board
  attr_accessor :pos
  
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def symbol
    raise "Create a symbol for this piece" 
  end

  def to_s
    "#{symbol}"
  end
end