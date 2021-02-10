require_relative 'piece.rb'

class Pawn < Piece

  def symbol
    "P".colorize(color)
  end

  def moves

  end

  private
  def at_start_row?
    #if white and row 1 or if black and row 6
    if color == :white && pos[0] == 1
      return true
    end
    if color == :black && pos[0] == 6
      return true
    end
    false
  end

  def forward_dir
    #if white then 1, if black then -1
    if color == :white
      return 1
    else
      return -1
    end
  end

  def forward_steps
    #if start_pos is at_start_row then pos += 1 or pos += 2
    #if start_pos is not at_start_row then pos += 1 
    if at_start_row?
      steps = [[1, 0], [2, 0]]
    else
      steps = [[1, 0]]
    end

    steps.each {|step| step[0] *= forward_steps }
  end

  def side_attacks
    #if white & opposite color piece at move_dir [1, 1] or [1, -1], then valid
    #if black & opposite color piece at move_dir [-1, -1] or [-1, 1], then valid

    new_row = pos[0] + forward_dir
    new_col1 = pos[1] + 1
    new_col2 = pos[1] - 1
    sides = [[new_row, new_col1], [new_row, new_col2]]
    sides.select { |side| !@board[side].nil? && @board[side].color != color }
  end

end