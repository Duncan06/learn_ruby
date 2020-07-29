class TicTacToe
    def initialize(p1, p2)
        @board = [
                  [[],[],[]],
                  [[],[],[]],
                  [[],[],[]]
                 ]
        
        @p1 = p1

        @p2 = p2

    end
        
    def play_game()

        one, two = get_symbols()

        game = TicTacToe.new(one, two)

        game_playing = true

        turn = 0

        while game_playing

            display_board()

            step = move(turn)

            empty = available_tile(step)

            while !empty 

                puts "This is already taken."

                step = move(turn)

                empty = available_tile(step)
            

            if turns < 3
                if player_wins(one) 
                    puts "#{one} wins!"
                    game_playing = false
                end

                if player_wins(two)
                    puts "#{two} wins!"
                    game_playing = false
                end
            end

            turn += 1
        end
    end


    def player_wins(symbol)
        
        player_symbol = symbol
        row0 = @board[0]
        row1 = @board[1]
        row2 = @board[2]


        ## Check if column matches
        match0 = row0[0] == symbol && row1[0] == symbol && row2[0] == symbol
        match1 = row0[1] == symbol && row1[1] == symbol && row2[1] == symbol
        match2 = row0[2] == symbol && row1[2] == symbol && row2[2] == symbol

        ## Check for any matches
        if 
            match0 ||
            match1 ||
            match2 ||
            row0.each {|x| x == symbol} ||
            row1.each {|x| x == symbol} ||
            row2.each {|x| x == symbol} ||
            (row0[0] == symbol && row[1] == symbol && row2[2] == symbol) ||
            (row0[2] == symbol && row[1] == symbol && row2[0] == symbol)
            
            return true

        end

        return false
    end

    def display_board(turn)

        board00 = if @board[0][0].legnth < 1? "0-0" : @board[0][0]
        board01 = if @board[0][1].legnth < 1? "0-1" : @board[0][1]
        board02 = if @board[0][2].legnth < 1? "0-2" : @board[0][2]
        board10 = if @board[1][0].legnth < 1? "1-0" : @board[1][0]
        board11 = if @board[1][1].legnth < 1? "1-1" : @board[1][1]
        board12 = if @board[1][2].legnth < 1? "1-2" : @board[1][2]
        board20 = if @board[2][0].legnth < 1? "2-0" : @board[2][0]
        board21 = if @board[2][1].legnth < 1? "2-1" : @board[2][1]
        board22 = if @board[2][2].legnth < 1? "2-2" : @board[2][2]

        puts "                 |                 |                
                  #{board00}   |    #{board01}   | #{board02}
                               |                 |
               ---------------------------------------------------
                               |                 |
                  #{board10}   |    #{board11}   | #{board12}
                               |                 |
               ----------------------------------------------------
                               |                 |
                  #{board20}   |    #{board21}   | #{board22}
                               |                 |                 "
        end
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

    def move(turn)
        if turn % 2 == 0
            puts "Where would you like to move player one?"
            move = gets.chomp
            while move.length != 3
                puts "Enter correct format"
                move = gets.chomp
            end
        end

        if turn % 2 == 1
            puts "Where would you like to move player two?"
            move = gets.chomp
            while move.length != 3
                puts "Enter correct format"
                move = gets.chomp
            end
        end
    end

    def available_tile(step)
        case step

        when "0-0"

            @board[0][0] == "0-0"
    
        when "0-1"

            @board[0][1] == "0-1"
        
        when "0-2"

            @board[0][2] == "0-2"

        when "1-0"

            @board[1][0] == "1-0"

        when "1-1"

            @board[1][1] == "1-1"

        when "1-2"

            @board[1][2] == "1-2"

        when "2-0"

            @board[2][0] == "2-0"

        when "2-1"

            @board[2][1] == "2-1"

        when "2-2"

            @board[2][2] == "2-2"

        else
            puts "Please use correct format."
            false
        end
    end
end

x = TicTacToe("O", "X").new
x.play_game