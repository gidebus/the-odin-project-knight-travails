# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  let(:board) { Board.new(8, 8) }
  describe '#initialize' do
    it 'has a length and a height as attributes' do
      expect(board.length).to eq(8)
      expect(board.height).to eq(8)
    end
  end
end
