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

        while game_playing

            display_board()

            if player_wins(one) 
                puts "#{one} wins!"
                game_playing = false
            end

            if player_wins(two)
                puts "#{two} wins!"
                game_playing = false
            end
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

        ## Check for any matchees
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

        next = move(turn)
        if next == 
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

end