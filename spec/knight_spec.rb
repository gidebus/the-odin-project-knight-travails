# frozen_string_literal: true

require_relative '../lib/knight'
require_relative '../lib/square'

describe Knight do
  let(:knight) { Knight.new }

  describe '#movility_to_squares' do
    it 'transforms the piece movility into square classes' do
      expect(knight.movility_to_squares.length).to eq(8)
      expect(knight.movility_to_squares.first).to be_an_instance_of(Square)
    end
  end

  describe '#knight_moves' do
    context 'prints a message with the moves it took' do
      square = Square.new(3, 3)
      initial_position = Node.new(square)
      
      ending_square = Square.new(4, 3)
      ending_position = Node.new(ending_square)
      
      specify { expect { knight.knight_moves(initial_position, ending_position) }.to output(/You made it in 3 moves! Here's your path:/).to_stdout }
      specify { expect { knight.knight_moves(initial_position, ending_position) }.to output(/[3, 3]/).to_stdout }
      specify { expect { knight.knight_moves(initial_position, ending_position) }.to output(/[4, 5]/).to_stdout }
      specify { expect { knight.knight_moves(initial_position, ending_position) }.to output(/[6, 4]/).to_stdout }
      specify { expect { knight.knight_moves(initial_position, ending_position) }.to output(/[4, 3]/).to_stdout }
    end
  end
end
