require 'tdd'


describe 'my_uniq' do
  context 'when given a non-array' do
    it 'returns an error' do
      expect { my_uniq(7) }.to raise_error(ArgumentError)
    end
  end
  context 'removes duplicates' do
    it 'removes a 1 and 3 from the given array' do
      expect(my_uniq([1, 2, 1, 3, 3])).to eq([1, 2, 3])
    end

  end
  
  context 'when there are no duplicates' do
    it 'return a new array that has the same elements as the original array' do
      expect(my_uniq([1, 2, 3])).to eq([1, 2, 3])
    end

  end

end

describe 'Array#two_sum' do
  context 'Returns all pairs of positions where the elements at those positions sum to zero' do
    it 'returns the correct result' do
      expect([1, 0, -1, 2, -2].two_sum).to eq([[0, 2], [3, 4]])
    end
  end
  context 'When none of the pairs sum to zero' do
    it 'returns an empty array' do
      expect([1, 2, 3, 4].two_sum).to eq([])
    end
  end
end

describe 'my_transpose' do
  context 'When given a 1D array' do
    it 'Returns an ArgumentError' do
      expect { my_transpose([1, 2, 3]) }.to raise_error(ArgumentError)
    end
  end

  context 'When given a nested array' do
    it 'converts between row oriented and column-oriented representation' do
      expect(my_transpose([
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ])).to eq([
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
      ])
    end
  end
end

describe "#stock_picker" do
  context "accepts an array of prices" do
    it "returns an ArgumentError if not given an array" do
      expect {stock_picker(4)}.to raise_error(ArgumentError)
    end
  end

  it "returns the most profitable pair of days" do
    expect(stock_picker([20, 40, 100, 30, 65, 30])).to eq([0, 2])
  end

  context "when all buy/sell pairs are negative in profitability" do
    it "returns nil" do 
      expect(stock_picker([50, 40, 30, 20, 10])).to eq(nil)
    end
  end

  it "buy date does not come after sell date" do
    expect(stock_picker([100, 40, 100])).to_not eq([1, 0]) 
  end
end

describe TowersOfHanoi do
  subject(:tower) {TowersOfHanoi.new(3)}
  describe '#initialize' do
    it 'sets up three arrays and the discs' do
      expect(tower.pegs).to eq([[3, 2, 1], [], []])
    end
  end

  describe '#move' do
    context 'when moving a disc from one peg to another' do
      context 'when trying to move the current peg on top of a smaller peg' do
        it 'should raise TowerError' do
          tower.move(0, 1)
          expect { tower.move(0, 1) }.to raise_error(TowerError)
        end
      end

      context 'when successful' do
        it 'adds the disc to the new peg' do
          tower.move(0, 1)
          expect(tower.pegs[1]).to eq([1])
        end

        it 'removes the disc from the old peg' do
          tower.move(0, 1)
          expect(tower.pegs[0]).to eq([3, 2])
        end
      end

      context 'when there are no discs on the starting peg' do
        it 'raises an error "there are no discs left"' do
          expect { tower.move(2,1) }.to raise_error("there are no discs left")
        end
      end
    end
  end

  describe '#won?' do
    context "when the second or third peg contain all of the discs in descending order" do
      it "returns true" do
        tower = TowersOfHanoi.new(3)
        tower.pegs[0], tower.pegs[1] = tower.pegs[1], tower.pegs[0]
        expect(tower.won?).to eq(true)
      end
    end

    context "when the second or third peg does not contain all of the discs in descending order" do
      it "returns false" do
        tower = TowersOfHanoi.new(3)
        expect(tower.won?).to eq(false)
      end

    end
  end
end