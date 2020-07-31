class Mastermind 

    def initialize()

        @code = []
        
    end

    def play_game()

        game_playing = true

        turn = 0

        while game_playing

            guess = player_guess()

            puts guess

        end

    end

    def player_guess()

        puts "Please guess four colors in order from red, blue, yellow, green, brown, and purple."
        
        puts "Use the format red, blue, green, blue."

        options = ["red", "blue", "yellow", "green", "brown", "purple"]

        answer = gets.chomp.to_s.downcase

        answer = answer.split(',').map(&:strip)

        while answer.length != 4
                
            puts answer.length

            puts "Please select from given colors, as well as only guessing four in the correct format."

            answer = gets.chomp.to_s.downcase

            answer = answer.split(',').map(&:strip)
        
        end

        good_color = 0

        answer.each do |color|

            if options.any?{ |option| option == color }

                good_color += 1

            end

        end

        good_color == 4 ? answer : player_guess()

    end
end

x = Mastermind.new()
x.play_game()