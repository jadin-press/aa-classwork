# #initialize should create all 52 cards
# #card should all be unique, with 4 cards having the same rank/symbol combination
# #store cards in an array
# make sure we only deal from the top of the deck
# should have a #shuffle method
# should have a constant for rank/value combinations in Deck class
# # have a constant for all the suits

require "deck.rb"

describe Deck do
  subject(:deck) {Deck.new}
  describe "#initialize" do
    it "creates 52 cards" do
      expect(deck.cards.count).to eq(52)

      deck.cards.map! {|card| [card.rank, card.suit]}
      expect(deck.cards).to eq(deck.cards.uniq) 
    end
  end

  describe "#count" do
    it "returns the number of cards in the deck" do
      expect(deck.count).to eq(52)
    end
  end

  describe "#mix!" do
    it "shuffles the deck" do
      expect(deck).to_not eq(deck.mix!)
    end
  end

end
