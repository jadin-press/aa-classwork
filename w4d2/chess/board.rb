require_relative 'piece.rb'
require_relative 'connector.rb'

class Board
  def initialize
    @rows = Array.new(8) { Array.new(8, nil) }
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
        if !space.nil?
          space.to_s
        else
          "N".colorize(:green)
        end
      end
    end

    new_grid.each do |row|
      puts row.join(" ").on_light_red
    end
  end

end


board = Board.new()
board.print
puts "--------------------"
board.move_piece([1,3], [2,3])
board.move_piece([1,4], [2,4])
board.move_piece([1,5], [2,5])
# board.move_piece([1,4], [3,4])
# board.print
# puts "--------------------"
p board[[0,4]].moves