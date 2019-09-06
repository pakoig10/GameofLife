# frozen_string_literal: true

require './cell'
require './game_board'
require './game'

puts 'Game of Life'
print 'Write the size of the board: '
size = gets.chomp.to_i
print 'Write the generations: '
generations = gets.chomp.to_i
GameofLife::Game.new(size, generations)
