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

        turn = 0

        while game_playing

            game_playing = false

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