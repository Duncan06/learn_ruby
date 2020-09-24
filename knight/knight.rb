module KnightTravail

    def knight(current_square)

        possible moves = []

        x = current_square[0]

        y = current_square[1]

        if (x + 1 <= 7) && (y + 2 <= 7)

            possible_moves << [x+1, y+2]

        end

        if (x + 2 <= 7) && (y + 1 <= 7)

            possible_moves << [x+2, y+1]

        end

        if (x - 1 >= 0) && (y - 2 >= 0)

            possible_moves << [x-1, y-2]

        end

        if (x- 2 >= 0) && (y - 1 >= 0)

            possible_moves << [x-2, y-1]

        end

        if (x + 1 <= 7) && (y - 2 >= 0)

            possible_moves << [x+1, y-2]

        end

        if (x + 2 <= 7) && (y - 1 >= 0)

            possible_moves << [x+2, y-1]

        end

        if (x - 1 >= 0) && (y + 2 <= 7)

            possible_moves << [x-1, y+2]

        end

        if (x- 2 >= 0) && (y + 1 <= 7)

            possible_moves << [x-2, y+1]

        end

        possible_moves

    end

end