def my_uniq(array)
  raise ArgumentError if !array.is_a?(Array)
  new_arr = []
  array.each {|ele| new_arr << ele if !new_arr.include?(ele)}
  new_arr
end

class Array
  def two_sum
    indices = []
    (0...self.length - 1).each do |i|
      (i+1...self.length).each do |j|
        indices << [i, j] if self[i] + self[j] == 0
      end
    end
    indices
  end
end

def my_transpose(array)
  raise ArgumentError if !array[0].is_a?(Array)
  new_arr = Array.new(array.length) { [] }
  array.each_with_index do |row, i|
    row.each_with_index do |ele, j|
      new_arr[j] << ele
    end
  end
  new_arr
end

def stock_picker(array)
  raise ArgumentError if !array.is_a?(Array)
  profit_dict = {}

  (0...array.length - 1).each do |i|
    (i+1...array.length).each do |j|
      profit_dict[[i,j]] = array[j] - array[i]
    end
  end
  
  max_profit = profit_dict.values.max
  return nil if max_profit < 0
  profit_dict.each {|k, v| return k if v == max_profit}
end


class TowerError < StandardError
end

class TowersOfHanoi

  attr_reader :pegs, :num_discs

  def initialize(num)
    @num_discs = num
    @pegs = Array.new(3) { [] }
    counter = num
    while counter >= 1
      @pegs[0] << counter
      counter -= 1
    end
  end

  def move(start_peg, end_peg)
    raise TowerError if !@pegs[end_peg].empty? && @pegs[start_peg][-1] > @pegs[end_peg][-1]
    raise "there are no discs left" if @pegs[start_peg].empty?
    @pegs[end_peg] << @pegs[start_peg].pop
  end

  def won?
    return true if @pegs[1] == (1..num_discs).to_a.reverse
    return true if @pegs[2] == (1..num_discs).to_a.reverse
    false
  end
end