def merge_sort(array)

    combinations = []

    result = []

    sorted = false

    sides(array, array.size, combinations)

    new_combo = []

    until sorted 

        if combinations.size == 1

            sorted = true

        end

        if combinations[0].size > 1

            new_combo = new_combo || []

            resort = []

            leftside = nil

            rightside = nil

            lvalue = nil

            rvalue = nil

            while true

                if combinations.length == 1

                    combinations = combinations[0]

                    break

                end

                if leftside == [] && lvalue == nil

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

                    break

                elsif combinations[0] != [] && resort == []

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

                    break

                elsif combinations[1] != [] && resort == []

                    rightside = combinations.shift

                    rvalue = rightside.shift

                end
            
                if lvalue <= rvalue
    
                    resort << lvalue

                    lvalue = leftside.shift

                elsif lvalue > rvalue

                    resort << rvalue
                        
                    rvalue = rightside.shift

                else

                    result.concat(resort)

                end
            end

            if resort != []

                result << resort

            end

            if combinations == []

                combinations = result

            end

            

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

    p combinations

end

def sides(array, size, combinations)

    if array.length <= 2 

        combinations << array

    else

        left = sides(array[0..(size/2 - 1)], size / 2, combinations)

        right = sides(array[size/2..size-1], size / 2, combinations)

    end

end

merge_sort([2,3,4,6,4,8,17,9,10])