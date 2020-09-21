class Board

    attr_accessor :squares

    def initialize

        @squares = []

    end

    def build_board(x,y)

        first = 0

        second = 0

        while first < x

            while second < y

                @squares << [first, second]

                second += 1

            end
            
            second = 0

            first += 1

        end

        @squares

    end

    def knight(current_square)

        possible_moves = []

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

    def knight_moves(x, y, que=[x], movesTaken=[], current_path=[])

        if x == y

            current_path << x

            current_path

        end

        current = que.shift

        if movesTaken.include?(x)

            if que.include?(x)

                movesTaken << x

                moves = knight(current[0], current[1])

                moves.each{ |x| que << x }

                current_path << x

                knight_moves(x, y, que, movesTaken, current_path)

            end

        end

end


test = Board.new

test.build_board(8,8)

p test.knight([4,4])
