require_relative 'knight.rb'

module KnightsTravial

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


        def knight_moves(x, y, que=[x], movesTaken=[], current_path=[], routes = {})

            current = que.shift

            p "#{ current == y }, current#{current}, y#{y}"

            if current == y

                current_path << current

                current_path

            end

            if !movesTaken.include?(current)

                if !que.include?(current)

                    moves = knight(current)

                    moves.each{ |z| que <<  z}

                    p que

                    knight_moves(current, y, que, movesTaken, current_path, routes)

                end

            end

            current_path

        end

end

    end

end