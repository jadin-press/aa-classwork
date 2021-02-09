class Board
  def initialize
    @rows = Array.new(8) { Array.new(8, nil) }
    (0..7).each do |i|
      @rows[0][i] = Piece.new
      @rows[1][i] = Piece.new
      @rows[6][i] = Piece.new
      @rows[7][i] = Piece.new
    end
  end

  def move_piece(start, end)
    if @rows[start[0]][start[1]].nil?
      raise "There is no piece at this position"
    end
    size = (0..7).to_a
    if !size.include?(end[0]) || !size.include?(end[1])
      raise "This piece cannot move to end position"
    end
    
  end
end