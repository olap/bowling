require './spec/spec_helper'

describe Game do
  describe 'to_s' do
    let(:game) { Game.new }
    it 'returns nothing yet' do
      game.to_s.should eq('')
    end
  end
end
