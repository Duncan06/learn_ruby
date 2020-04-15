def picker(arr)
    min = nil
    min_place = 0
    max = nil
    max_place = arr.length - 1
    place = 0
    value = 0
    choice = []
    arr.each do |n|
        if min == nil || n < min
            if (min == nil || max == nil) || (max - min) > value
                if place < max_place
                    min = n
                    min_place = place
                end
            end
            place += 1
        elsif max == nil || n > max
            if (min == nil || max == nil) || (max - min) > value
                if max_place > min_place 
                    max = n
                    max_place = place
                end
            end
            place += 1
        else 
            place += 1
        end
    end
    return [min_place, max_place].inspect
end

puts picker([17,3,6,9,15,8,6,1,10])