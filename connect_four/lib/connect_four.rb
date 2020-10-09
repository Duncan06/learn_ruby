class Connect_Four

    attr_accessor :board

    def initialize()

        @board = [
                 [[], [], [], [], [], [], []],
                 [[], [], [], [], [], [], []],
                 [[], [], [], [], [], [], []],
                 [[], [], [], [], [], [], []],
                 [[], [], [], [], [], [], []],
                 [[], [], [], [], [], [], []]
                ]

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

    def check_win(row0, row1, row2, row3, row4, row5, color)

        x = 0

        y = 3

        while y < 7

            column0 = [row0[x..y], row1[x..y], row2[x..y], row3[x..y]]

            column1 = [row1[x..y], row2[x..y], row3[x..y], row4[x..y]]

            column2 = [row2[x..y], row3[x..y], row4[x..y], row5[x..y]]

            ## Check if column matches
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


            ## Check if row matches
            match12 = row0[x..y].all? {|x| x == color}
            match13 = row1[x..y].all? {|x| x == color} 
            match14 = row2[x..y].all? {|x| x == color} 
            match15 = row3[x..y].all? {|x| x == color}
            match16 = row4[x..y].all? {|x| x == color}
            match17 = row5[x..y].all? {|x| x == color}

            ## Check diagnals
            match18 = row0[0] == color && row1[1] == color && row2[2] == color && row3[3] == color
            match19 = row0[3] == color && row1[2] == color && row2[1] == color && row3[0] == color
            match20 = row1[0] == color && row2[1] == color && row3[2] == color && row4[3] == color
            match21 = row1[3] == color && row2[2] == color && row3[1] == color && row4[0] == color
            match22 = row2[0] == color && row3[1] == color && row4[2] == color && row5[3] == color
            match23 = row2[3] == color && row3[2] == color && row4[1] == color && row5[0] == color
    1
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