class TicTacToe

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
        
        ## Starts game
        while game_playing

            current_player = turn % 2 == 0 ? one : two

            display_board(turn)

            step = move(turn)

            empty = available_tile(step, current_player)

            while !empty 

                puts "This is already taken."

                step = move(turn)

                empty = available_tile(step, current_player)
            
            end

            ## Check for wins when possible.
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

            ## Declare end of game, ask for rematch.
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

    ## Checks for win.
    def player_wins(symbol)

        row0 = @board[0]

        row1 = @board[1]

        row2 = @board[2]

        column = [row0, row1, row2]


        ## Check if column matches
        match0 = column.all? {|x| x[0] == symbol}
        match1 = column.all? {|x| x[1] == symbol}
        match2 = column.all? {|x| x[2] == symbol}


        ## Check if row matches
        match3 = row0.all? {|x| x == symbol}
        match4 = row1.all? {|x| x == symbol} 
        match5 = row2.all? {|x| x == symbol} 

        ## Check diagnals
        match6 = row0[0] == symbol && row1[1] == symbol && row2[2] == symbol
        match7 = row0[2] == symbol && row1[1] == symbol && row2[0] == symbol
1
        ## Check for any matches
        if 
            match0 ||
            match1 ||
            match2 ||
            match3 ||
            match4 ||
            match5 ||
            match6 ||
            match7
            
            return true

        end

        return false
    end

    # Visual board to see plays on command line.
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


    ## Allows player to customize symbol.
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

    ## Receives desired move of player.
    def move(turn)
        player = turn % 2 == 0 ? "one" : "two"
        puts "Where would you like to move player #{player}?"
        move = gets.chomp
        while move.length != 1
            puts "Enter correct format"
            move = gets.chomp
        end
        move
    end


    ## Checks if square is occupied or empty after looking up square.
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