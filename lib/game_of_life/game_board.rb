module GameofLife
  class Board
    attr_reader :size
    attr_accessor :initial_life, :array_board
    def initialize(size, array_board, initial_life)
      @size = size
      @array_board = array_board
      @initial_life = initial_life
      seed(@array_board, @size, @initial_life)
    end

    def seed(array_board, size, initial_life = nil)
      indices = []
      size.times { |x| size.times { |y| indices << [x, y] } }
      indices.shuffle[0, ((size * size) / 2)].each { |x, y| array_board[y][x] = 1 }
    end

    def self.new_board(size)
      Array.new(size) { Array.new(size, 0) }
    end

    def self.print_board(array_board, generation)
      puts "Generation #{generation}"
      array_board.each { |row| row.each { |column| print "#{column == 1 ? '*' : '.'} " }; puts "\n" }
    end
  end
end