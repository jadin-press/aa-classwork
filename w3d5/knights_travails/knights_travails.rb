require_relative "../polytreenode/lib/00_tree_node.rb"
class KnightPathFinder
  
  attr_reader :considered_positions

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
    
    valid_moves = possible_move_values.select do |move| 
      (0..7).include?(move[0]) && (0..7).include?(move[1])
    end
  end
  
  def initialize(position)
    @root_node = PolyTreeNode.new(position)
    @considered_positions = [position]
  end

  # def new_move_positions(pos)
  #   accepted_moves = KnightPathFinder.valid_moves(pos).reject { |move| @considered_positions.include?(move) }
  #   @considered_positions += accepted_moves
  #   accepted_moves
  # end
  def new_move_positions(pos)
    accepted_moves = []
    KnightPathFinder.valid_moves(pos).each do |move| 
      unless @considered_positions.include?(move)
        @considered_positions << move
        accepted_moves << move
      end
    end
    accepted_moves
  end

  def build_move_tree
    queue = [@root_node]
    
    until queue.empty?
      current_node = queue.shift
      new_move_positions(current_node.value).each do |position|
        next_node = PolyTreeNode.new(position)
        queue << next_node
        current_node.add_child(next_node)
      end
    end
  end

  def find_path(end_pos)
    end_node = self.dfs(end_pos)
    trace_path_back(end_node)
  end

  def trace_path_back(node)
    path = [node]
    until path.first == self
      path.unshift(path.first.parent)
    end
    path.reverse
  end

end

k = KnightPathFinder.new([0, 0])

k.build_move_tree

# p k.considered_positions.size

# p KnightPathFinder.valid_moves([0,0])

p k.find_path([7,1])