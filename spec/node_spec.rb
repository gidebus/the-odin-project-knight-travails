# frozen_string_literal: true

require_relative '../lib/node'
require_relative '../lib/square'

describe Node do
  let(:square) { Square.new(0, 0) }
  let(:node) { Node.new(square) }

  describe '#initialize' do
    it 'contains a node with coordinates' do
      expect(node.square.row).to eq(0)
      expect(node.square.column).to eq(0)
    end

    it 'has a predecessor node' do
      expect(node.previous_node).to be_nil
      previous_square = Square.new(1, 2)
      child_node = Node.new(previous_square, node)
      expect(child_node.previous_node).to eq(node)
    end
  end
end
