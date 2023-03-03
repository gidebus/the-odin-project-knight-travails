# frozen_string_literal: true

# represents a square in a board chess that has coordinates
class Square
  attr_accessor :row, :column

  def initialize(row, column)
    @row = row
    @column = column
  end
  
end
