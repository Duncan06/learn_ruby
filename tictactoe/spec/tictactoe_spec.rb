require "./lib/tictactoe.rb"
require 'stringio'

describe TicTacToe do

    describe "#player_wins" do

        it "decides win across top" do

            game = TicTacToe.new()

            game.board[0][0] = "O"
            game.board[0][1] = "O"
            game.board[0][2] = "O"

            result = game.player_wins("O")

            expect(result).to eq(true)

        end

        it "decides win vertically" do

            game = TicTacToe.new()

            game.board[0][0] = "O"
            game.board[1][0] = "O"
            game.board[2][0] = "O"

            result = game.player_wins("O")

            expect(result).to eq(true)

        end

        it "decides win diagonally" do

            game = TicTacToe.new()

            game.board[0][0] = "O"
            game.board[1][1] = "O"
            game.board[2][2] = "O"

            result = game.player_wins("O")

            expect(result).to eq(true)

        end

    end

    describe "#decider" do

        it "reports square is empty" do

            game = TicTacToe.new()

            result = game.decider(0,0, "O")

            expect(result).to eq(true)

        end

        it "reports square is full" do

            game = TicTacToe.new()

            game.board[0][0] = "O"

            result = game.decider(0,0,"O")

            expect(result).to eq(false)

        end

    end

    describe "#move" do

        let(:input) {StringIO.new('a')}

        it "asks for player one's move" do

            game = TicTacToe.new()

            $stdin = input

            result = game.move(0)

            expect { print "Where would you like to move player one?" }.to output.to_stdout

            $stdin = STDIN

        end

        it "asks for player two's move" do

            game = TicTacToe.new()

            $stdin = input

            result = game.move(1)

            expect { print "Where would you like to move player two?" }.to output.to_stdout

            $stdin = STDIN

        end

        it "returns user input" do

            game = TicTacToe.new()

            $stdin = input

            result = game.move(1)

            expect(result).to eq("a")

            $stdin = STDIN

        end

    end

    describe "#available_tile" do

        it "checks if available tile accepts input" do

            game = TicTacToe.new()

            result = game.available_tile("a", "O")

            expect(result).to eq(true)

        end

    end

end