# frozen_string_literal: true

require 'dice'

describe Dice do
  before do
    Random.srand 1
  end

  describe '.parse' do
    context 'given an empty list' do
      it 'returns zero' do
        expect(Dice.parse([])).to eq({ details: [], total: 0 })
      end
    end

    context 'given some elements in several formats' do
      it 'returns the details and appropriate sum' do
        result = Dice.parse(%w[4 2d4 1d10])
        # Must recall: This random result was fixed against seed=1.
        expect(result).to eq({ details: [
                               { count: 1, sides: 4, values: [2] },
                               { count: 2, sides: 4, values: [4, 1] },
                               { count: 1, sides: 10, values: [9] }
                             ], total: 16 })
      end
    end
  end
end
