module Enumerable
    def my_each
        arr = is_a?(Range) ? to_a : self
        i = 0
        while i < arr.size
            yield arr[i]
            i += 1
        end
    end

    def my_each_with_index
        i = 0
        while i < self.size
            yield self[i], i
            i += 1
        end
    end

    def my_select
        arr = []
        self.my_each do |x| 
            if yield x
                arr << x
            end
        end
        return arr
    end

    def my_all?
        self.my_each do |x|
            if !yield x
                return false
            end
        end
        return true
    end

    def my_any?
        self.my_each do |x|
            if yield x
                return true
            end
        end
        return false
    end

    def my_none?
        self.my_each do |x|
            if yield x
                return false
            end
        end
        return true
    end

    def my_count
        num = 0
        self.my_each do |x|
            if yield x
                num += 1
            end
        end
        return num
    end

    def my_map
        arr = []
        self.my_each do |x|
            val = yield x
            arr << val
        end
        return arr
    end

    def my_inject(*args)
        routine = args[0] if args[0].is_a? Integer

        if args[0].is_a? Symbol
            my_each{ |i| routine = routine ? routine.send(args[0], i) : i}
            routine
        
        else
            sum = 0
            my_each do |x|
                sum = yield(sum, x)
            end
            sum
        end
    end
end

# [1,2,3].my_each{|x| puts x**2}
# [1,2,3].my_each_with_index{|x, y| puts "Equals #{x**2}, with index #{y}"}
# puts [1,2,5,6].my_select{|x| x < 5}.inspect
# puts [1,2,3,6].my_all?{|x| x < 5}
# puts [4,4,5].my_any?{|x| x < 4}
# puts [4,5,6].my_none?{|x| x < 3}
# puts [4,5,6].my_count{|x| x%2 == 0}
# puts [1,2,3,4].my_map{|x| x**2}
puts (5..10).my_inject { |sum, n| sum + n }

def multiply_els
    [2,4,5].my_inject(:*)
end

puts multiply_els()