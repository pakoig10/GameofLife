# frozen_string_literal: true
module GameofLife
  class Cell
    def self.evolve(board, size)
      new = GameofLife::Board.new_board(size)
      size.times { |row| size.times { |column| new[row][column] = fate(board, row, column, size) } } 
      new
    end

    def self.dead_alive?(new, size, board)
      size.times { |row| size.times { |column| return false if board[row][column] == 1 } }
      true
    end

    def self.fate(board, row, column, size)
      left_right = [0, row - 1].max .. [row + 1, size - 1].min
      top_bottom = [0, column - 1].max .. [column + 1, size - 1].min
      flag = 0
      left_right.each do |row_for|
        top_bottom.each do |column_for|
          flag += board[row_for][column_for] unless (row_for == row) && (column_for == column)
        end
      end
      (flag == 3) || ((flag == 2) && (board[row][column] == 1)) ? 1 : 0
    end
  end
end
