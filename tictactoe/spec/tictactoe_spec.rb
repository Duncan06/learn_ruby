require "./lib/tictactoe.rb"

describe TicTacToe do

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

    it "decides a move for the first player" do

        game = TicTacToe.new()

        player = double("first")

        turn = 0

        allow(player).to receive(:move).and_return("a")

        result = game.move(turn)

        player.move

        expect(result).to eq(true)

    end

end