class Card
  RANK = { "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10, "J" => 11, "Q" => 12, "K" => 13, "A" => 14}
  SUITS = {"C" => 1, "D" => 2, "H" => 3, "S" => 4}

  attr_reader :rank, :suit
  
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

end