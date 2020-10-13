class Connect_Four

    attr_accessor :board, :turn

    def initialize()

        @board = [
                 [[], [], [], [], [], [], []],
                 [[], [], [], [], [], [], []],
                 [[], [], [], [], [], [], []],
                 [[], [], [], [], [], [], []],
                 [[], [], [], [], [], [], []],
                 [[], [], [], [], [], [], []]
                ]

        @turn = 0

    end

    def play_game()

        game_playing = true

        p1, p2 = player_names()

        selection = player_colors()

        while game_playing

            display_board()

            puts "Your turn #{turn(selection)}."

            answer = player_move()

            move(answer, turn(selection))

            if @turn > 5

                finish = player_wins([turn(selection)])

                if finish == true

                    winner = @turn % 2 == 0 ? p1 : p2

                    puts "#{winner} wins!"

                    display_board()

                    return

                end
            
            end

            @turn += 1     

        end

    end

    def player_wins(color)

        row0 = @board[0]

        row1 = @board[1]

        row2 = @board[2]

        row3 = @board[3]

        row4 = @board[4]

        row5 = @board[5]

        result = check_win(row0, row1, row2, row3, row4, row5, color)

        if result

            true

        else

            false

        end

    end

    def player_names()

        puts "What would you like your name to be player one?"

        p1 = gets.chomp.to_s

        puts "What would you like your name to be player two?"

        p2 = gets.chomp.to_s

        return p1, p2

    end

    def player_colors()

        puts "Would you like to be red or black player one?"

        color = gets.chomp.to_s

        right_color = check_color(color)

        until right_color

            puts "Please select from red or black."

            color = gets.chomp.to_s

            right_color = check_color(color)

        end

        color == "red"? ["red", "black"] : ["black", "red"]

    end

    def check_color(color)

        if color == "red" || color == "black"

            true

        else

            false

        end

    end

    def turn(selection)

        selection[@turn%2]

    end

    def player_move()

        puts "What column would you like to place a chip?"

        answer = gets.chomp.to_i

        number = proper_range(answer)

        until number

            puts "Please enter a number between 1-7."

            answer = gets.chomp.to_i

            number = proper_range(answer)
        
        end

        answer

    end

    def proper_range(number)

        (number >= 1 && number <= 7) ? true : false

    end

    def move(column, color)

        height = 5

        while height >= 0

            if @board[height][column - 1] == []

                @board[height][column - 1] = [color]

                p @board

                return

            end

            height -= 1

        end

        puts "Column full, enter another choice."

        move(player_move, color)

    end

    def display_board()

        board00 = @board[0][0].length < 1 ? "_" : @board[0][0]
        board01 = @board[0][1].length < 1 ? "_" : @board[0][1]
        board02 = @board[0][2].length < 1 ? "_" : @board[0][2]
        board03 = @board[0][3].length < 1 ? "_" : @board[0][3]
        board04 = @board[0][4].length < 1 ? "_" : @board[0][4]
        board05 = @board[0][5].length < 1 ? "_" : @board[0][5]
        board06 = @board[0][6].length < 1 ? "_" : @board[0][6]

        board07 = @board[1][0].length < 1 ? "_" : @board[1][0]
        board08 = @board[1][1].length < 1 ? "_" : @board[1][1]
        board09 = @board[1][2].length < 1 ? "_" : @board[1][2]
        board10 = @board[1][3].length < 1 ? "_" : @board[1][3]
        board11 = @board[1][4].length < 1 ? "_" : @board[1][4]
        board12 = @board[1][5].length < 1 ? "_" : @board[1][5]
        board13 = @board[1][6].length < 1 ? "_" : @board[1][6]

        board14 = @board[2][0].length < 1 ? "_" : @board[2][0]
        board15 = @board[2][1].length < 1 ? "_" : @board[2][1]
        board16 = @board[2][2].length < 1 ? "_" : @board[2][2]
        board17 = @board[2][3].length < 1 ? "_" : @board[2][3]
        board18 = @board[2][4].length < 1 ? "_" : @board[2][4]
        board19 = @board[2][5].length < 1 ? "_" : @board[2][5]
        board20 = @board[2][6].length < 1 ? "_" : @board[2][6]

        board21 = @board[3][0].length < 1 ? "_" : @board[3][0]
        board22 = @board[3][1].length < 1 ? "_" : @board[3][1]
        board23 = @board[3][2].length < 1 ? "_" : @board[3][2]
        board24 = @board[3][3].length < 1 ? "_" : @board[3][3]
        board25 = @board[3][4].length < 1 ? "_" : @board[3][4]
        board26 = @board[3][5].length < 1 ? "_" : @board[3][5]
        board27 = @board[3][6].length < 1 ? "_" : @board[3][6]

        board28 = @board[4][0].length < 1 ? "_" : @board[4][0]
        board29 = @board[4][1].length < 1 ? "_" : @board[4][1]
        board30 = @board[4][2].length < 1 ? "_" : @board[4][2]
        board31 = @board[4][3].length < 1 ? "_" : @board[4][3]
        board32 = @board[4][4].length < 1 ? "_" : @board[4][4]
        board33 = @board[4][5].length < 1 ? "_" : @board[4][5]
        board34 = @board[4][6].length < 1 ? "_" : @board[4][6]

        board35 = @board[5][0].length < 1 ? "_" : @board[5][0]
        board36 = @board[5][1].length < 1 ? "_" : @board[5][1]
        board37 = @board[5][2].length < 1 ? "_" : @board[5][2]
        board38 = @board[5][3].length < 1 ? "_" : @board[5][3]
        board39 = @board[5][4].length < 1 ? "_" : @board[5][4]
        board40 = @board[5][5].length < 1 ? "_" : @board[5][5]
        board41 = @board[5][6].length < 1 ? "_" : @board[5][6]

        puts "

        |_#{board00}__|_#{board01}__|_#{board02}__|_#{board03}__|_#{board04}__|_#{board05}__|_#{board06}__|
        |_#{board07}__|_#{board08}__|_#{board09}__|_#{board10}__|_#{board11}__|_#{board12}__|_#{board13}__|
        |_#{board14}__|_#{board15}__|_#{board16}__|_#{board17}__|_#{board18}__|_#{board19}__|_#{board20}__|
        |_#{board21}__|_#{board22}__|_#{board23}__|_#{board24}__|_#{board25}__|_#{board26}__|_#{board27}__|
        |_#{board28}__|_#{board29}__|_#{board30}__|_#{board31}__|_#{board32}__|_#{board33}__|_#{board34}__|
        |_#{board35}__|_#{board36}__|_#{board37}__|_#{board38}__|_#{board39}__|_#{board40}__|_#{board41}__|
 
        "

    end

    def check_win(row0, row1, row2, row3, row4, row5, color)

        x = 0

        y = 3

        while y < 7

            column0 = [row0[x..y], row1[x..y], row2[x..y], row3[x..y]]

            column1 = [row1[x..y], row2[x..y], row3[x..y], row4[x..y]]

            column2 = [row2[x..y], row3[x..y], row4[x..y], row5[x..y]]

            ## Check if column matches

            if x == 0 || x == 3

                match0 = column0.all? {|x| x[0] == color}
                match1 = column0.all? {|x| x[1] == color}
                match2 = column0.all? {|x| x[2] == color}
                match3 = column0.all? {|x| x[3] == color}

                match4 = column1.all? {|x| x[0] == color}
                match5 = column1.all? {|x| x[1] == color}
                match6 = column1.all? {|x| x[2] == color}
                match7 = column1.all? {|x| x[3] == color}

                match8 = column2.all? {|x| x[0] == color}
                match9 = column2.all? {|x| x[1] == color}
                match10 = column2.all? {|x| x[2] == color}
                match11 = column2.all? {|x| x[3] == color}

            end


            ## Check if row matches
            match12 = row0[x..y].all? {|x| x == color}
            match13 = row1[x..y].all? {|x| x == color} 
            match14 = row2[x..y].all? {|x| x == color} 
            match15 = row3[x..y].all? {|x| x == color}
            match16 = row4[x..y].all? {|x| x == color}
            match17 = row5[x..y].all? {|x| x == color}

            ## Check diagnals
            
            match18 = row0[x] == color && row1[x+1] == color && row2[x+2] == color && row3[x+3] == color
            match19 = row0[x+3] == color && row1[x+2] == color && row2[x+1] == color && row3[x] == color
            match20 = row1[x] == color && row2[x+1] == color && row3[x+2] == color && row4[x+3] == color
            match21 = row1[x+3] == color && row2[x+2] == color && row3[x+1] == color && row4[x] == color
            match22 = row2[x] == color && row3[x+1] == color && row4[x+2] == color && row5[x+3] == color
            match23 = row2[x+3] == color && row3[x+2] == color && row4[x+1] == color && row5[x] == color

            ## Check for any matches
            if 
                match0 || match1 || match2 || match3 ||
                match4 || match5 || match6 || match7 ||
                match8 || match9 || match10 || match11 ||
                match12 || match13 || match14 || match15 ||
                match16 || match17 || match18 || match19 ||
                match20 || match21 || match22 || match23
                
                return true

            end

            x += 1

            y += 1

        end

        false

    end

end

game = Connect_Four.new()

game.play_game