class Mastermind 

    def initialize()

        @code = []
        
        @original = {}

        @colors = {}

        @computer_guess = []

        @colors_guessed = [[], [], [], []]

    end

    # Game starts

    def play_game()

        game_playing = true

        turn = 0 

        answer = code_breaker_or_giver()

        # Possible options

        options = ["red", "blue", "yellow", "green", "brown", "purple"]
            
        answer ? @code = generate_code(options) : @code = get_code(options)

        puts @code

        set_original()

        # Turns begin

        while game_playing

            puts "\nIt is currently turn #{turn}"

            guess = answer ? player_guess(options) : computer_play(options)

            puts guess

            if guess == @code

                puts "You solved the code in #{turn} turns!"

                puts "Would you like to play again? y/n"

                game_playing, turn, answer = play_again?(options)


            elsif turn > 11

                puts "You weren't able to solve the code in 12 turns!"

                puts "#{@code} was the answer."

                puts "Would you like to play again? y/n"
                
                game_playing, turn, answer = play_again?(options)

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

        handle_input(options)

    end

    def handle_input(options)

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

    def get_code(options)

        puts "\nWhat would you like the code to be? You may choose from red, blue, yellow, \ngreen, brown, and purple.\n\n"

        puts "Use the format red, blue, green, blue.\n\n"

        handle_input(options)

    end

    # Set hash for number of each color

    def set_original()

        for i in 0..3

            @original.key?("#{@code[i]}") ? @original[@code[i]] += 1 : @original[@code[i]] = 1

        end

    end

    # Take in if person wants to make code or break it.

    def code_breaker_or_giver()

        puts "Would you like to be the Code Breaker or Giver? Put Breaker or Giver."

        response = gets.chomp.to_s.downcase

        if response == "breaker"

            return true

        elsif response == "giver"

            return false

        else 

            puts "Please select an appropriate option."

            code_breaker_or_giver()

        end

    end

    # Have compuer make guesses.

    def computer_play(options)

        if @computer_guess != []

            filter_guess(options)

        else

            # Fill guess array.

            while @computer_guess.length < 4

                @computer_guess.push(options[rand(options.length)])

            end
        
        end

        puts "#{@computer_guess}"

        return @computer_guess

    end

    def filter_guess(options)

        for i in 0..3
                
            if @computer_guess[i] == @code[i]

                next

            else

                comparison(options, i)       

            end

        end

    end

    def comparison(options, i)

        color = options[rand(options.length)]

        different_color = false

        until different_color

            comparison = @colors_guessed[i].none?{ |x| x == color }

            if  comparison 

                @colors_guessed[i].push(color)

                @computer_guess[i] = color
                
                different_color = true

            else

                color = options[rand(options.length)]

                different_color = false
 
            end

        end

    end

    # Calculate number of correct colors and positions to return to player.
    
    def give_hint(guess)

        correct_color_and_position = 0

        correct_color = 0

        @colors = {}

        puts @colors.inspect

        for i in 0..3

            if guess[i] == @code[i]

                correct_color_and_position += 1

                correct_color += 1

                @colors.key?("#{guess[i]}") ? @colors[guess[i]] += 1 : @colors[guess[i]] = 1

            else 

                puts @code.count(guess[i]), @colors[guess[i]], guess[i]

                if (@code.include?(guess[i]) && (!@colors.key?(guess[i]) || (@code.count(guess[i]) >= @colors[guess[i]])))

                    correct_color += 1

                    @colors.key?("#{guess[i]}") ? @colors[guess[i]] += 1 : @colors[guess[i]] = 1

                end

            end

        end

        puts "You have #{correct_color_and_position} in the correct position and color, and #{correct_color} correct colors.\n\n"

    end

    def play_again?(options)

        response = gets.chomp.to_s

                if response == "y"

                    game_playing = game_reset()

                    answer = code_breaker_or_giver()

                    answer ? @code = generate_code(options) : @code = get_code(options)

                    turn = 0

                    set_original()

                    return game_playing, turn, answer

                else

                    false
                
                end

    end

    def game_reset()

        @code = []

        @original = {}

        @computer_guess = []

        @colors_guessed = [[], [], [], []]

        game_playing = true

    end
end

x = Mastermind.new()
x.play_game()