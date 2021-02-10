require_relative 'piece.rb'
require_relative 'connector.rb'

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

  def move_piece(start, end_pos)
    if self[start].nil?
      raise "There is no piece at this position"
    end
    size = (0..7).to_a
    if !size.include?(end_pos[0]) || !size.include?(end_pos[1])
      raise "This piece cannot move to end position"
    end

    piece = self[start]
    self[end_pos] = piece
    self[start] = nil
  end

  def [](position)
    @rows[position[0]][position[1]]
  end

  def []=(position, value)
    @rows[position[0]][position[1]] = value
  end

  def print
    new_grid = @rows.to_a.map do |row|
      row.to_a.map do |space|
        if space.is_a?(Piece)
          "P"
        else
          "N"
        end
      end
    end

    new_grid.each do |row|
      puts row.join(" ")
    end
  end

end


board = Board.new()
board.print
board.move_piece([1,3], [3,3])
board.print