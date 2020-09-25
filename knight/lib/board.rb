require_relative 'knight.rb'

module KnightsTravial

    class Board

        attr_accessor :squares, :x, :y
    
        def initialize
    
            @squares = []

            @x = 0

            @y = 0
    
        end
    
        def build_board(x,y)

            @x = x - 1

            @y = y - 1
    
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

                    new_moves = Knight.get_moves(self, pos)

                    new_moves.reject! { |move| visited.include?(move) }

                    queue << [new_moves, path.clone << pos]

                    visited << pos

                end
            
            end

            nil    

        end

    end

end
