# frozen_string_literal: true

require_relative './square'
require_relative './move_manager'

# Knight Class
class Knight
  attr_reader :moves

  @@movility = [[1, 2], [-1, 2], [1, -2], [-1, -2], [2, 1], [-2, 1], [2, -1], [-2, -1]]
  
  def initialize
    @moves = movility_to_squares
    @move_manager = MoveManager.new
  end

  def movility_to_squares
    @@movility.map do |coordinates|
      Square.new(coordinates.first, coordinates.last)
    end
  end

  def knight_moves(start_position, end_position)
    moves = @move_manager.find_position(start_position, end_position, @moves)
    moves = @move_manager.get_path_to_root(moves)
    moves = @move_manager.print_moves(moves)
  end
end
