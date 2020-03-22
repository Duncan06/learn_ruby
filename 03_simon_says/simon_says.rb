#write your code here
def echo word
    "#{word}"
end

def shout word
    "#{word}".upcase
end

def repeat word, times = 2
    ("#{word} "*times).rstrip
end

def start_of_word word, length
    "#{word}".slice(0, length)
end

def first_word phrase
    single = phrase.split(" ")
    single[0]
end

def titleize word
    result = ""
    little = ["and", "the", "over"]
    word = word.split(" ")
    word.map do |single|
        if little.any? {|word| single.include?(word)} && result != ""
            single
        else
            single = single.capitalize
        end
        result << single + " "
    end
    "#{result}".rstrip
end