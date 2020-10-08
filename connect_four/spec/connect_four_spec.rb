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

            expect(game.player_wins).to eq(true)

        end

    end

end

