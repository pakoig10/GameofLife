module GameofLife
  class Game
    attr_accessor :size, :generations

    def initialize(size, generations, initial_life = nil)
      @size = size
      @generations = generations
      array_board = Array.new(size) { Array.new(size, 0) }
      @board = GameofLife::Board.new(size, array_board, initial_life)
      reason = process(@board.array_board)
      final(reason)
    end

    def process(board)
      @generations.times do |gen|
        new = GameofLife::Cell.evolve(board, @size)
        GameofLife::Board.print_board(new, gen + 1)
        break 'all_dead' if GameofLife::Cell.dead_alive?(new, size, board) == true
        break 'static'   if @board.array_board == new
        board = new
      end
    end

    def final(reason)
      if    reason == 'all_dead' then puts 'no more life.'
      elsif reason == 'static'   then puts 'no movement'
      else                            puts 'specified lifetime ended'
      end
      puts "\n"
    end
  end
end