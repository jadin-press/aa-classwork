class KnightPathFinder
  def self.valid_moves(pos)
    row, col = pos
    possible_moves = {
      up_up_right:      [row + 2, col + 1],
      up_right_right:   [row + 1, col + 2],
      down_right_right: [row - 1, col + 2],
      down_down_right:  [row - 2, col + 1],
      down_down_left:   [row - 2, col - 1],
      down_left_left:   [row - 1, col - 2],
      up_left_left:     [row + 1, col - 2],
      up_up_left:       [row + 2, col - 1]
    }
  end
  
  def initialize(position)
    @root_node = position
    @considered_positions = []
  end

  def build_move_tree
    
  end


end