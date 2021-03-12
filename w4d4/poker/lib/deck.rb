class Deck
 
  attr_reader :cards
  
  def initialize
    @cards = []
    Card::RANK.each do |k1, v1|
      Card::SUITS.each do |k2, v2|
        @cards << Card.new(k1, k2)
      end
    end 
  end

  def count
    @cards.count
  end

  def mix!
    @cards.shuffle!    
  end
end