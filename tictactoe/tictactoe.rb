class TicTacToe

    attr_accessor :board

    def initialize()
        @board = [
                  [[],[],[]],
                  [[],[],[]],
                  [[],[],[]]
                 ]
    end
        
    def play_game()

        one, two = get_symbols()

        game_playing = true

        turn = 0

        while game_playing

            display_board(turn)

            step, symbol = move(turn, one, two)

            if turn % 2 == 0
                empty = available_tile(step, one)

            else
                empty = available_tile(step, two)
            end

            while !empty 

                puts "This is already taken."

                step = move(turn, one, two)

                empty = available_tile(step, symbol)
            
            end

            if turn > 3
                if player_wins(one) 
                    display_board(turn)
                    puts "#{one} wins!"
                    game_playing = false

                elsif player_wins(two)
                    display_board(turn)
                    puts "#{two} wins!"
                    game_playing = false
                end
            end
            turn += 1

            if turn == 9 || player_wins(one) || player_wins(two)

                if turn == 9 && !player_wins(one) && !player_wins(two)
                    puts "Tied Game."
                end
                
                if reset()
                    game_playing = true
                    turn = 0
                end
            end
        end
    end


    def player_wins(symbol)

        row0 = @board[0]
        row1 = @board[1]
        row2 = @board[2]


        ## Check if column matches
        match0 = row0[0] == symbol && row1[0] == symbol && row2[0] == symbol
        match1 = row0[1] == symbol && row1[1] == symbol && row2[1] == symbol
        match2 = row0[2] == symbol && row1[2] == symbol && row2[2] == symbol
1
        ## Check for any matches
        if 
            match0 ||
            match1 ||
            match2 ||
            row0.all? {|x| x == symbol} ||
            row1.all? {|x| x == symbol} ||
            row2.all? {|x| x == symbol} ||
            (row0[0] == symbol && row1[1] == symbol && row2[2] == symbol) ||
            (row0[2] == symbol && row1[1] == symbol && row2[0] == symbol)
            
            return true

        end

        return false
    end

    def display_board(turn)

        board00 = @board[0][0].length < 1? "a" : @board[0][0]
        board01 = @board[0][1].length < 1? "b" : @board[0][1]
        board02 = @board[0][2].length < 1? "c" : @board[0][2]
        board10 = @board[1][0].length < 1? "d" : @board[1][0]
        board11 = @board[1][1].length < 1? "e" : @board[1][1]
        board12 = @board[1][2].length < 1? "f" : @board[1][2]
        board20 = @board[2][0].length < 1? "g" : @board[2][0]
        board21 = @board[2][1].length < 1? "h" : @board[2][1]
        board22 = @board[2][2].length < 1? "i" : @board[2][2]

        puts "                                  
                 #{board00}      |        #{board01}        |    #{board02}
                        |                 |
        ---------------------------------------------------
                        |                 |
                  #{board10}     |        #{board11}        |    #{board12}
                        |                 |
        ----------------------------------------------------
                        |                 |
                  #{board20}     |        #{board21}        |    #{board22}
                        |                 |                 "
    end

    def get_symbols()

        puts "What would you like player one's marker to be?"
        p1 = gets.chomp.to_s

        while p1.length > 1
            puts "Please enter a single character."
            p1 = gets.chomp.to_s
        end
            
        puts "What would you like player two's marker to be?"
        p2= gets.chomp.to_s

        while p2.length > 1
            puts "Please enter a single character."
            p2 = gets.chomp.to_s
        end

        return p1, p2
    end

    def move(turn, one, two)
        if turn % 2 == 0
            puts "Where would you like to move player one?"
            move = gets.chomp
            symbol = one
            while move.length != 1
                puts "Enter correct format"
                move = gets.chomp
                symbol = one
            end
            return move, symbol
        end

        if turn % 2 == 1
            puts "Where would you like to move player two?"
            move = gets.chomp
            symbol = two
            while move.length != 1
                puts "Enter correct format"
                move = gets.chomp
                symbol = two
            end
            return move, symbol
        end
    end

    def available_tile(step, symbol)
        case step

        when "a"

            decider(0,0, symbol)
    
        when "b"

            decider(0,1, symbol)
        
        when "c"

            decider(0,2, symbol)

        when "d"

            decider(1,0, symbol)

        when "e"

            decider(1,1, symbol)

        when "f"

            decider(1,2, symbol)

        when "g"

            decider(2,0, symbol)

        when "h"

            decider(2,1, symbol)

        when "i"

            decider(2,2, symbol)

        else
            puts "Please use correct format."
            false
        end
    end
    
    def decider(x, y, symbol)
        if @board[x][y].length == 0
            @board[x][y] = symbol
            return true
        else
            return false
        end
    end

    def reset()
        puts "Play again? y/n "
        answer = gets.chomp
        if answer == "y"
            @board = [
                [[],[],[]],
            [[],[],[]],
            [[],[],[]]
            ]
        else
            false
        end
    end
end

x = TicTacToe.new()
x.play_game()