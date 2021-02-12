require "byebug"

class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(array)
    array.all? { |ele| POSSIBLE_PEGS.has_key?(ele.upcase) }
  end

  attr_reader :pegs

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map { |peg| peg.upcase }
    else
      raise_error
    end
  end

  def self.random(length)
    arr = []
    length.times { arr << POSSIBLE_PEGS.keys.sample }
    Code.new(arr)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    guess.pegs.each_with_index { |peg, idx| count +=1 if guess.pegs[idx] == @pegs[idx] }
    count
  end

  def num_near_matches(guess)
    count = 0
    guess.pegs.each_with_index do |peg, i|
      if @pegs.include?(peg) && guess.pegs[i] != @pegs[i] 
        count += 1
      end
    end
    count
  end

  def ==(other_code)
    self.pegs == other_code.pegs
  end

  

end




