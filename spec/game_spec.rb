require './spec/spec_helper'

describe Game do
  let(:game) { Game.new }

  context 'a new game' do
    describe 'to_s' do
      it 'returns nothing yet' do
        game.to_s.should eq('')
      end
    end
  end

  context 'a game of strikes' do
    before do
      12.times do
        game.roll(10)
      end
    end

    describe 'score' do
      it 'scores 300' do
        game.score.should eq(300)
      end
    end
  end

  context 'a game of no strikes or halves' do
    before do
      10.times do
        game.roll(9)
        game.roll(0)
      end
    end

    describe 'score' do
      it 'scores 90' do
        game.score.should eq(90)
      end
    end
  end

  context 'a game of halves' do
    before do
      21.times do
        game.roll(5)
      end
    end

    describe 'score' do
      it 'scores 150' do
        game.score.should eq(150)
      end
    end
  end
end
