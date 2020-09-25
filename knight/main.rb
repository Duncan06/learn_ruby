require_relative 'lib/board.rb'

$board = KnightsTravial::Board.new

$board.build_board(8,8)

def knight_moves(start, last)

    path = $board.knight_moves(start, last)

    if path.nil?

        puts "Cannot end at assigned square.\n"

        return

    end

    puts "You've made it in #{path.size} move#{path.size != 1 ? 's' : ''} \n Here's your path:"

    path.each { |coord| puts " #{coord}" }

end

knight_moves([1, 3], [4, 7])