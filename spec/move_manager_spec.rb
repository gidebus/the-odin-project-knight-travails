# frozen_string_literal: true

require_relative '../lib/node'
require_relative '../lib/square'
require_relative '../lib/board'
require_relative '../lib/move_manager'

# Move Class
describe MoveManager do
  let(:manager) { MoveManager.new }

  describe '#possible_moves' do
    it 'displays the possible moves from the given position' do
      initial_position = Node.new(Square.new(0, 0))
      movility = [ Square.new(1, 2), Square.new(1, -2) ]
      expected = [1, 2]
      expect(manager.possible_moves(initial_position, movility).first).to be_an_instance_of(Node)
      expect(manager.possible_moves(initial_position, movility).first.square.coordinates).to eq(expected)
    end
  end

  describe '#valid_move?' do
    it 'returns true if move is within the board dimensions' do
      move = Node.new(Square.new(1, 2))
      expect(manager.valid_move?(move)).to be(true)
    end

    it 'returns false if move is out of board dimensions' do
      move = Node.new(Square.new(11, 21))
      expect(manager.valid_move?(move)).to be(false)
    end
  end

  describe '#find_position' do
    it 'returns the position requested if it matches' do
      initial_position = Node.new(Square.new(0, 0))
      ending_position = Node.new(Square.new(1, 2))
      movility = [ Square.new(1, 2), Square.new(1, -2) ]
      expected = [1, 2]
      expect(manager.find_position(initial_position, ending_position, movility)).to be_an_instance_of(Node)
      expect(manager.find_position(initial_position, ending_position, movility).square.coordinates).to eq(expected)
    end
  end

  describe '#get_path_to_root' do
    it 'returns an ordered array of all the coordinates visited' do
      initial_position = Node.new(Square.new(0, 0))
      second_position = Node.new(Square.new(1, 2), initial_position)
      third_position = Node.new(Square.new(3, 6), second_position)
      expected = [ [0, 0], [1, 2], [3, 6] ]
      expect(manager.get_path_to_root(third_position)).to eq(expected)
    end
  end

  describe '#print_moves' do
    context 'prints a message with the moves it took' do
      moves = [ [0, 0], [1, 2], [3, 6] ]
      specify { expect { manager.print_moves(moves) }.to output(/You made it in 2 moves! Here's your path:/).to_stdout }
    end
  end
end
