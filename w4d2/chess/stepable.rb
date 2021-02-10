module Stepable
  KING_MOVES = [[1, 0], [1, 1], [0, 1], [-1, 1], [-1, 0], [-1, -1], [0, -1], [1, -1]]
  KNIGHT_MOVES = [[2,1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]]

  def moves
    pos_x, pos_y = pos
    possible_moves = []
    if self.is_a?(King)
      KING_MOVES.each do |dir|
        new_pos_x = pos_x + dir[0]
        new_pos_y = pos_y + dir[1]
        possible_moves << [new_pos_x, new_pos_y] if valid_move?(dir)
      end
    end
    if self.is_a?(Knight)
      KNIGHT_MOVES.each do |dir|
        new_pos_x = pos_x + dir[0]
        new_pos_y = pos_y + dir[1]
        possible_moves << [new_pos_x, new_pos_y] if valid_move?(dir)
      end
    end
    possible_moves
  end

  private
  def move_diffs
    raise "You need to create a move method for this piece"
  end

  def valid_move?(dir)
    pos_x, pos_y = pos
    new_pos_x = pos_x + dir[0]
    new_pos_y = pos_y + dir[1]
    if (0..7).to_a.include?(new_pos_x) && (0..7).to_a.include?(new_pos_y)
      if @board[[new_pos_x, new_pos_y]].nil?
        return true
      elsif @board[[new_pos_x, new_pos_y]].color != self.color
        return true
      end
    end
    false
  end

  

end