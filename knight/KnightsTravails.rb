class Node

    include Comparable

    attr_accessor :data, :left, :right

    def initialize(data)

        @data = data

        @left = nil

        @right = nil

    end

    # def <=> (other)

    #     @data <=> other.data

    # end

end

class Tree

    attr_accessor :root

    def initialize(array)

        @array = array

        @root = build_tree(@array, 0, @array.squares.length)

    end 

    def build_tree(branch, start, last)

        if  (start > last)

            return nil

        end

        mid = ((start + last)/2).floor 

        root = Node.new(branch[mid])

        root.left = build_tree(branch, start, mid - 1)

        root.right = build_tree(branch, mid + 1, last)

        return root

    end

end

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

    def knightMove(x, y)

        que = []

        moves_taken = []

        while x != y

             moves = knight([x[0]], x[1])

             if !moves_taken.include?(x)

                if !que.include?(x)

                    que << x

                    moves_taken << x

                end

            end

        



end


test = Board.new

test.build_board(8,8)

p test.knight([4,4])
