class Mastermind 

    def initialize()

        @code = []
        
    end

    # Game starts

    def play_game()

        game_playing = true

        turn = 0

        # Turns begin

        while game_playing

            guess = player_guess()

            if guess == @code

                puts "You solved the code in #{turn} turns!"

                puts "Would you like to play again? y/n"

                play_again?()


            elsif turn > 13

                puts "You weren't able to solve the code in 12 turns!"
                
                play_again?()

            else

                turn += 1

            end

        end

    end

    def player_guess()

        puts "Please guess four colors in order from red, blue, yellow, green, brown, and purple."
        
        puts "Use the format red, blue, green, blue."

        # Possible options

        options = ["red", "blue", "yellow", "green", "brown", "purple"]

        # Format answer

        answer = gets.chomp.to_s.downcase

        answer = answer.split(',').map(&:strip)

        while answer.length != 4
                
            puts answer.length

            puts "Please select from given colors, as well as only guessing four in the correct format."

            answer = gets.chomp.to_s.downcase

            answer = answer.split(',').map(&:strip)
        
        end

        # Check is appropriate colors

        good_color = 0

        answer.each do |color|

            if options.any?{ |option| option == color }

                good_color += 1

            end

        end

        # Return input, or call this function again. 

        good_color == 4 ? answer : player_guess()

    end

    def play_again?()

        response = gets.chomp.to_s

                if response == "y"

                    game_reset()

                else

                    game_playing == false
                
                end

    end

    def game_reset()

        @code = []

        turn = 0

        game_playing = true

    end
end

x = Mastermind.new()
x.play_game()