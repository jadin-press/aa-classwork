require_relative 'piece.rb'
require_relative 'connector.rb'

class Board
  def initialize
    @rows = Array.new(8) { Array.new(8, NullPiece.instance) }
    fill_board
  end

  def fill_board
    back_row = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    back_row.each_with_index do |piece, i|
      @rows[0][i] = piece.new(:white, self, [0, i])
      @rows[1][i] = Pawn.new(:white, self, [1, i])
      @rows[7][i] = piece.new(:black, self, [7, i])
      @rows[6][i] = Pawn.new(:black, self, [6, i])
    end
  end

  def move_piece(start, end_pos)
    if self[start].is_a?(NullPiece)
      raise "There is no piece at this position"
    end
    size = (0..7).to_a
    if !size.include?(end_pos[0]) || !size.include?(end_pos[1])
      raise "This piece cannot move to end position"
    end

    piece = self[start]
    piece.pos = end_pos
    self[end_pos] = piece
    self[start] = NullPiece.instance
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
        space.to_s
      end
    end

    new_grid.each do |row|
      puts " ".on_light_red.underline + row.join(" | ").on_light_red.underline + " ".on_light_red.underline
    end
  end

end


# board = Board.new()
# board.print
# puts "--------------------"
# # p board[[1,0]].moves
# board.move_piece([1,3], [5,3])
# board.print
# p board[[6,4]].moves
