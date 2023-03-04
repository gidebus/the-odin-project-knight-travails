# frozen_string_literal: true

# Node class can be treated as moves that will be saved in the MoveManager
class Node
  attr_accessor :square, :previous_node
  def initialize(square, previous_node = nil)
    @square = square
    @previous_node = previous_node
  end
end
