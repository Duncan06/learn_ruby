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

        visitied = []


        def knight_moves(start, last)

            visited = []

            queue = [[[start], []]]

            until queue.empty?

                next_moves, path = queue.shift

                return path << last if next_moves.include? last


                next_moves.each do |pos|

                    new_moves = Knight.get_moves(pos)

                    new_moves.reject! { |move| visited.include?(move) }

                    queue << [new_moves, path.clone << pos]

                    visited << pos

                end
            
            end

            nil    

        end

    end

end
