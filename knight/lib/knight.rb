
class Knight
    
        def self.get_moves(board, current_square)

        possible_moves = []

        x = current_square[0]

        y = current_square[1]

        if (x + 1 <= board.x) && (y + 2 <= board.y)

            possible_moves << [x+1, y+2]

        end

        if (x + 2 <= board.x) && (y + 1 <= board.y)

            possible_moves << [x+2, y+1]

        end

        if (x - 1 >= 0) && (y - 2 >= 0)

            possible_moves << [x-1, y-2]

        end

        if (x- 2 >= 0) && (y - 1 >= 0)

            possible_moves << [x-2, y-1]

        end

        if (x + 1 <= board.x) && (y - 2 >= 0)

            possible_moves << [x+1, y-2]

        end

        if (x + 2 <= board.x) && (y - 1 >= 0)

            possible_moves << [x+2, y-1]

        end

        if (x - 1 >= 0) && (y + 2 <= board.y)

            possible_moves << [x-1, y+2]

        end

        if (x- 2 >= 0) && (y + 1 <= board.y)

            possible_moves << [x-2, y+1]

        end

        possible_moves

    end

end