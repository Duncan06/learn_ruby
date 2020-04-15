def substrings(word, dictionary)
    # Make array for input
    phrase = []
    # Set input for parsing
    word = word.downcase
    # Take out punctuations
    word = word.gsub(/[^A-Za-z\s]/, '')
    word = word.split(" ")
    word.each do |words|
        # Add if just one
        if words.length == 1
            phrase << words
            next
        end
        # Create every subset
        for i in 0...(words.length)
            phrase << words[0..i] 
            phrase << words[i..words.length]
            if (words.length > 2) || (!phrase.include? words[i])
                if i != 0 && i != words.length - 1
                    phrase << words[i]
                end
            end
        end
        # Remove additional copies from range beginning and ending 
        phrase.delete(words)
        phrase << words
    end
    # Makes hash to count matches
    dic = Hash.new(0)
    phrase.each do |match|
        if dictionary.include? match
            dic[match] += 1
        end
    end
    return dic, phrase.inspect
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)