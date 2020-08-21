def merge_sort(array)

    return array if array.length <= 1

    mid = (array.length / 2).floor
    
    leftside = merge_sort(array[0..mid - 1])

    rightside = merge_sort(array[mid..array.length])

    final = []

    until leftside.empty? || rightside.empty? 

        if leftside[0] <= rightside[0]
        
            final << leftside.shift

        else

            final << rightside.shift

        end
    
    end

    final.concat(leftside, rightside)

end

p merge_sort([2,3,4,6,4,8,17,100,9,13,14])