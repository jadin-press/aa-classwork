module Slideable
  HORIZONTAL_DIRS = [[1, 0], [0, 1], [-1, 0], [0, -1]]
  DIAGONAL_DIRS = [[1, 1], [1, -1], [-1, -1], [-1, -1]]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    all_moves = []
    if self.is_a?(Rook)
      horizontal_dirs.each do |dir|
        all_moves += grow_unblocked_moves_in_dir(dir[0], dir[1])
      end
    end

    if self.is_a?(Bishop)
      diagonal_dirs.each do |dir|
        all_moves += grow_unblocked_moves_in_dir(dir[0], dir[1])
      end
    end

    if self.is_a?(Queen)
      horizontal_dirs.each do |dir|
        all_moves += grow_unblocked_moves_in_dir(dir[0], dir[1])
      end
      diagonal_dirs.each do |dir|
        all_moves += grow_unblocked_moves_in_dir(dir[0], dir[1])
      end
    end

    all_moves
  end

  private
  def move_dirs
    raise "You need to create a move_dirs method for this piece"
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    possible_moves = []
    pos_x = pos[0]
    pos_y = pos[1]
    while true
      pos_x += dx
      pos_y += dy
      if (0..7).to_a.include?(pos_x) && (0..7).to_a.include?(pos_y)
        if @board[[pos_x, pos_y]].is_a?(NullPiece)
          possible_moves << [pos_x, pos_y]
        elsif @board[[pos_x, pos_y]].color == self.color
          break
        elsif @board[[pos_x, pos_y]].color != self.color
          possible_moves << [pos_x, pos_y]
          break
        end
      else
        break
      end
    end
    possible_moves
  end
end