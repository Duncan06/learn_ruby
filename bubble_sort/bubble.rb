def bubble(arr)
    sorted = false
    until sorted
        i = 0
        count = 0
        while i < arr.length - 1
            if arr[i] > arr[i+1]
                arr[i], arr[i+1] = arr[i+1], arr[i]
                count = 0
                i += 1
            else
                count += 1
                i += 1
            end
        end
        if count == arr.length - 1
            sorted = true
        end
    end
    return arr       
end

puts bubble([4,3,78,2,0,2]).inspect

def bubble_sort_by(arr)
    sorted = false
    until sorted
        i = 0
        count = 0
        while i < arr.length - 1
            if yield(arr[i], arr[i+1]) > 0
                arr[i], arr[i+1] = arr[i+1], arr[i]
                count = 0
                i += 1
            else
                count += 1
                i += 1
            end
        end 
        if count == arr.length - 1
            sorted = true
        end
    end
    puts arr.inspect
end

bubble_sort_by(["hi","hello","hey"]) do |left,right|
    left.length - right.length
end