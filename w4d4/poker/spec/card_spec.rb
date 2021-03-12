# card should have two attributes: rank, value, suit
# should create a hash with rank/value pairs
# methods: getter methods and #initialize

require "card.rb"

describe Card do
  subject(:card) { Card.new(:A, :S) }
  describe "#initialize" do
    it "sets up the card attributes" do
      expect(card.rank).to eq(:A)
      expect(card.suit).to eq(:S)
    end
  end
end

