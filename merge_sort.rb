def merge_sort(array)

    combinations = []

    result = []

    sorted = false

    sides(array, array.size, combinations)

    new_combo = []

    combinations = merging(combinations, new_combo, result)

    p combinations, "here now, exited merging"

end

def sides(array, size, combinations)

    p array

    if array.length <= 2

        combinations << array
        
        p combinations, "combo"

    else

        left = sides(array[0..(size/2 - 1)], size / 2, combinations)

        right = sides(array[size/2..size-1], size / 2), combinations)

    end

    return combinations

end

def merging(combinations, new_combo, result)

    p combinations[0].size, "here"

    if combinations[0].size > 1

        new_combo = new_combo || []

        resort = []

        leftside = nil

        rightside = nil

        lvalue = nil

        rvalue = nil

        while true

            p "here 1"

            if combinations.length == 1 && resort == []

                combinations

                break

            end

            if leftside == [] && lvalue == nil

                p "here 2"

                if rvalue != nil

                    if rvalue > rightside[0]

                        resort << rightside.shift
                    
                    end

                    resort << rvalue

                end

                if rightside != []

                    resort.concat(rightside)

                end

                new_combo.concat(resort)

                p new_combo

                break

            elsif combinations[0] != [] && resort == []

                p "here for loading the lvalue."

                leftside = combinations.shift

                lvalue = leftside.shift

            end

            if rightside == [] && rvalue == nil

                if lvalue != nil

                    if lvalue > leftside[0]

                        resort << leftside.shift
                    
                    end

                    resort << lvalue

                elsif leftside != []

                    resort.concate(leftside)

                end

                new_combo.concat(resort)

                p new_combo

                break

            elsif combinations[1] != [] && resort == []

                p "here for loading rvalue"

                rightside = combinations.shift

                rvalue = rightside.shift

            end

            lvalue, rvalue, resort, result = compare(lvalue, rvalue, leftside, rightside, result, resort)
        

        end

        if resort != []

            result << resort

        end

        if combinations == []

            combinations = result

        end

        merging(combinations, new_combo, result)

    else

        combinations.each do |x|
            
            if x[1] == nil || x[0] < x[1] 

                next  
                
            else

                x[0], x[1] = x[1], x[0]

            end

        end
    end

end


def compare(lvalue, rvalue, leftside, rightside, result, resort)

    if lvalue <= rvalue

        p "here lvalue <= rvalue"
    
        resort << lvalue

        lvalue = leftside.shift

    elsif lvalue > rvalue

        p "here rvalue < lvalue"

        resort << rvalue
            
        rvalue = rightside.shift

    else

        p "Neither <= or < rvalue and lvalue"

        result.concat(resort)

    end

    return lvalue, rvalue, resort, result

end

merge_sort([2,3,4,6,4,8,17,100,9,13,14])