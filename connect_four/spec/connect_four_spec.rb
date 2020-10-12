require "./lib/connect_four.rb"
require "stringio"

describe Connect_Four do

    describe "#initialize" do

        it "initializes game board" do

            game = Connect_Four.new()

            result = game.board

            expect(result).to eq([
                                    [[], [], [], [], [], [], []],
                                    [[], [], [], [], [], [], []],
                                    [[], [], [], [], [], [], []],
                                    [[], [], [], [], [], [], []],
                                    [[], [], [], [], [], [], []],
                                    [[], [], [], [], [], [], []]
                                ])

        end

    end

    describe "#player_wins" do

        it "decides if there is a winner" do

            game = Connect_Four.new()

            game.board[5][0] = "O"
            game.board[5][1] = "O"
            game.board[5][2] = "O"
            game.board[5][3] = "O"

            expect(game.player_wins("O")).to eq(true)

        end

        it "decides diagonal win that from origin" do

            game = Connect_Four.new()

            game.board[0][0] = "O"
            game.board[1][1] = "O"
            game.board[2][2] = "O"
            game.board[3][3] = "O"

            expect(game.player_wins("O")).to eq(true)

        end

        it "decides diagonal win not from origin" do

            game = Connect_Four.new()

            game.board[1][1] = "O"
            game.board[2][2] = "O"
            game.board[3][3] = "O"
            game.board[4][4] = "O"

            expect(game.player_wins("O")).to eq(true)

        end

        it "decides backwards diagonal off origin at upper bound" do

            game = Connect_Four.new()

            game.board[5][6] = "O"
            game.board[4][5] = "O"
            game.board[3][4] = "O"
            game.board[2][3] = "O"

            expect(game.player_wins("O")).to eq(true)

        end

        it "decides column win" do 

            game = Connect_Four.new()

            game.board[5][6] = "O"
            game.board[4][6] = "O"
            game.board[3][6] = "O"
            game.board[2][6] = "O"

            expect(game.player_wins("O")).to eq(true)

        end

        it "decides row in middle of board win" do

            game = Connect_Four.new()

            game.board[3][3] = "O"
            game.board[3][4] = "O"
            game.board[3][5] = "O"
            game.board[3][6] = "O"

            expect(game.player_wins("O")).to eq(true)

        end

        it "decides there is no win" do

            game = Connect_Four.new()

            game.board[2][3] = "O"
            game.board[3][4] = "O"
            game.board[3][5] = "O"
            game.board[3][6] = "O"

            expect(game.player_wins("O")).to eq(false)
        
        end

    end

    describe "#player_names" do

        it "takes two player names" do

            io = StringIO.new

            io.puts "tyler"

            io.puts "jeff"

            io.rewind

            $stdin = io

            game = Connect_Four.new()

            result = game.player_names

            gets

            expect { print "What would you like player one's name to be?" }.to output.to_stdout

            gets

            expect { print "What would you like player two's name to be?" }.to output.to_stdout

            expect(result).to eq(["tyler", "jeff"])

            $stdin = STDIN

        end

    end

    describe "#player_colors" do

        it "asks what color the player would like to be" do

            $stdin = StringIO.new('red')
            
            game = Connect_Four.new()

            result = game.player_colors

            expect { print "Would you like to be red or black player one?" }.to output.to_stdout

            expect(result).to eq(["red", "black"])

            $stdin = STDIN

        end

        it "takes black as first player" do

            $stdin = StringIO.new('black')

            game = Connect_Four.new()

            result = game.player_colors

            expect { print "Would you like to be red or black player one?" }.to output.to_stdout

            expect(result).to eq(["black", "red"])

            $stdin = STDIN

        end

        it "asks for another color when wrong input" do

            io = StringIO.new

            io.puts "yellow"

            io.puts "black"

            io.rewind

            $stdin = io

            game = Connect_Four.new()

            result = game.player_colors

            gets

            expect { print "Would you like to be red or black player one?" }.to output.to_stdout

            gets

            expect { print "Please select from red or black." }.to output.to_stdout

            expect(result).to eq(["black", "red"])

            $stdin = STDIN

        end

    end

end

