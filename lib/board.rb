# frozen_string_literal: true

class Board
  attr_reader :length, :height
  def initialize(height, length)
    @length = length
    @height = height
  end
end
