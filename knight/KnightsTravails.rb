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

    def knight_moves(x, y, que=[x], movesTaken=[], current_path=[], routes = {})

        current = que.shift

        p "#{ current == y }, current#{current}, y#{y}"

        if current == y

            current_path << current

            current_path

        end

        if !movesTaken.include?(current)

            if !que.include?(current)

                movesTaken << current

                moves = knight(current)

                moves.each{ |z| que <<  z}

                p que

                current_path << current
                
                p "current path #{current_path}"

                routes[current_path] = moves

                p "routes #{routes}"

                knight_moves(current, y, que, movesTaken, current_path, routes)

            end

        end

        current_path

    end

end


test = Board.new

test.build_board(8,8)

p test.knight_moves([1, 3], [3, 7])
