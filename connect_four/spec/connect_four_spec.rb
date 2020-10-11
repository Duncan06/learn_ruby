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

    end

end

