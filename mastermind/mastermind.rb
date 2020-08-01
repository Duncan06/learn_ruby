class Mastermind 

    def initialize()

        @code = []
        
        @original = {}

    end

    # Game starts

    def play_game()

        game_playing = true

        turn = 0

        # Possible options

        options = ["red", "blue", "yellow", "green", "brown", "purple"]

        @code = generate_code(options)

        puts @code

        set_original()

        # Turns begin

        while game_playing

            puts "It is currently turn #{turn}"

            guess = player_guess(options)

            if guess == @code

                puts "You solved the code in #{turn} turns!"

                puts "Would you like to play again? y/n"

                game_playing = play_again?(options)


            elsif turn > 13

                puts "You weren't able to solve the code in 12 turns!"
                
                game_playing = play_again?(options)

            else

                give_hint(guess)

                turn += 1

            end

        end

    end

    def player_guess(options)

        puts "Please guess four colors in order from red, blue, yellow, green,\nbrown, and purple.\n\n"
        
        puts "Use the format red, blue, green, blue.\n\n"

        # Format answer

        answer = gets.chomp.to_s.downcase

        answer = answer.split(',').map(&:strip)

        while answer.length != 4

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

        good_color == 4 ? answer : player_guess(options)

    end

    def generate_code(options)

        while @code.length < 4

            @code.push(options[rand(options.length)])

        end

        return @code

    end

    def set_original()

        for i in 0..3

            @original.key?("#{@code[i]}") ? @original[@code[i]] += 1 : @original[@code[i]] = 1

            puts @code[i]

        end

    end

    # Calculate number of correct colors and positions to return to player.
    
    def give_hint(guess)

        correct_color_and_position = 0

        colors = {}

        for i in 0..3

            if guess[i] == @code[i]

                correct_color_and_position += 1

                colors.key?("#{guess}") ? colors[guess[i]] += 1 : colors[guess[i]] = 1

            else
        
                colors.key?("#{guess}") ? colors[guess[i]] += 1 : colors[guess[i]] = 1

            end

        end

        correct_color = 0

        number_of_colors = colors.size

        puts @original, colors

        colors.each do |k, v|

            if @original.key?(k)

                @original[k] == colors[k] ? correct_color = correct_color + colors[k] : correct_color = correct_color + @original[k] - colors[k]
            
            end

        end



        puts "You have #{correct_color_and_position} in the correct position and color, and #{correct_color} correct colors.\n\n"



    end

    def play_again?(options)

        response = gets.chomp.to_s

                if response == "y"

                    game_playing = game_reset()

                    @code = generate_code(options)

                else

                    false
                
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