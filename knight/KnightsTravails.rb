require_relative 'lib/board.rb'


test = Board.new

test.build_board(8,8)

p test.knight_moves([1, 3], [3, 7])
