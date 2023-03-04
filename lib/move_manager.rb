# frozen_string_literal: true

require_relative './node'
require_relative './square'
require_relative './board'

# MoveManager Class acts as tree for nodes/positions
class MoveManager
  attr_reader :board
  def initialize(board = Board.new(8, 8))
    @board = board
  end

    def possible_moves(position, movility)
      valid_moves = []
        movility.each do |move|
        possible_move = Square.new(move.row + position.square.row, move.column + position.square.column)
        possible_move = Node.new(possible_move, position)
        valid_moves.push(possible_move) if valid_move?(possible_move)
      end
      valid_moves
    end

  def valid_move?(position)
    position.square.row.between?(0, @board.length - 1) && position.square.column.between?(0, @board.height - 1)
  end

  def find_position(start_position, end_position, movility)
    queue = possible_moves(start_position, movility)
    position = queue.shift
    until position.square.coordinates == end_position.square.coordinates
      possible_moves(position, movility).each do |move|
        queue.push(move)
      end
      position = queue.shift
    end
    position
  end

  def get_path_to_root(position)
    squares = []
    until position.nil? do
      squares.push(position.square.coordinates)
      position = position.previous_node
    end
    squares.reverse
  end

  def print_moves(moves)
    index = moves.length - 1
    puts "You made it in #{index} moves! Here's your path:"
    moves.each do |move|
      p move
    end
  end
end
