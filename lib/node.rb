class Node
  attr_accessor :square, :previous_node
  def initialize(square, previous_node = nil)
    @square = square
    @previous_node = previous_node
  end
end
