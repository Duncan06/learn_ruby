class Book
    
    attr_reader :title
    

    def title=(val)
        val = titleize val
        @title = val
    end

    def titleize word
        result = ""
        little = ["and", "the", "a", "over", "in", "of", "an"]
        word = word.split(" ")
        word.map do |single|
            if little.any? {|word| single == word} && result != ""
                single
            else
                single = single.capitalize
            end
            result << single + " "
        end
        "#{result}".rstrip
    end
end
