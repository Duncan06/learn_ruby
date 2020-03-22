#write your code here
def translate word
    vowels = ['a', 'e', 'i', 'o', 'u']
    exceptions = ['qu', 'squ']
    sentence = ""
    word = word.split(" ")
    word.map do |single|
        if vowels.any? {|letter| single[0] == letter}
            first = ''
        elsif exceptions.any? {|exc| single.slice(0..1).include?(exc)}
            first = single.slice!(0..1)
        elsif exceptions.any? {|exc| single.slice(0..2).include?(exc)}
                first = single.slice!(0..2)
        elsif vowels.all? {|letter| single[1] != letter}
            if vowels.all? {|letter| single[2] != letter}
                first = single.slice!(0..2)
            else
                first = single.slice!(0..1)
            end
        else
            first = single.slice!(0)
        end
        single = single + first + 'ay'
        sentence << single + ' '
    end
    "#{sentence}".rstrip
end