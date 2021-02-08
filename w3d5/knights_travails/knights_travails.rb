class KnightPathFinder
  attr_reader :grid, 
  
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
    possible_move_values = possible_moves.values
    valid_moves = possible_move_values.select { |move| (0..7).include?(row) && (0..7).include?(col) }
  end
  
  def initialize(position)
    @root_node = position
    @considered_positions = [position]
    @grid = Array.new(8) { Array.new(8) }
  end

  def new_move_positions(pos)
    accepted_moves = KnightPathFinder.valid_moves(pos).reject { |move| @considered_positions.include?(move) }
    @considered_positions += accepted_moves
  end

  def build_move_tree
    queue = [@root_node]

    until 
    queue << new_move_positions(queue.shift)
  end

end