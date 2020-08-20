def merge_sort(array)

    combinations = []

    sorted = false

    sides(array, array.size, combinations)

    new_combo = []

    until sorted

        if combinations.size == 1

            sorted = true

        end

        p combinations

        left = 0

        right = 1

        if combinations[0].size > 1

            new_combo = []

            resort = []

            leftside = nil

            rightside = nil

            lvalue = nil

            rvalue = nil

            for x in 0..combinations.size/2

                if combinations[left] != [] && resort == []

                    p "here 1"

                    leftside = combinations.shift

                    p leftside

                    lvalue = leftside.shift

                elsif leftside == [nil]

                    p "here 4"

                    if rightside != [nil]

                        resort.concat(rightside)

                    end

                    p rightside

                    p resort

                    next

                end

                if combinations[right] != [] && resort == []

                    p "here 2"

                    rightside = combinations.shift

                    p rightside

                    rvalue = rightside.shift

                elsif rightside == [nil]

                    if leftside != [nil]

                        resort.concate(leftside)

                    end

                    p resort

                    next

                end

                puts lvalue, rvalue
            
                if leftside != [nil] && rightside != [nil] && lvalue <= rvalue
    
                    resort << lvalue

                    lvalue = leftside.shift

                    p resort

                    

                elsif leftside != [nil] && rightside != [nil] && lvalue > rvalue

                    resort << rvalue
                        
                    rvalue = rightside.shift

                else

                    new_combo << resort

                end
            end

            p combinations, "here5"

            combinations = new_combo
            
            p combinations

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

end

def sides(array, size, combinations)

    if array.length == 2 

        combinations << array

        p combinations

    else

        left = sides(array[0..(size/2 - 1)], size / 2, combinations)

        right = sides(array[size/2..size-1], size / 2, combinations)

    end

end

merge_sort([2,3,4,6,4,8,17,9])