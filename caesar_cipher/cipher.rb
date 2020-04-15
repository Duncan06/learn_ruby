def cipher(phrase, shift)
    str = ""
    shift %= 26
    phrase = phrase.split("")
    phrase.each do |l|
        value = l.ord
        if value > 96 && value < 123
            value %= 97
            value += shift
            value %= 26
            value += 97
            str << value.chr
        elsif value > 64 && value < 91
            value %= 65
            value += shift
            value %= 26
            value += 65
            str << value.chr
        else
            str << value.chr
        end
    end
    return str
end 

puts cipher("Well, this appears Zz", 0)