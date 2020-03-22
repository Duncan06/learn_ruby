#write your code here
def add a, b
    a+b
end

def subtract a, b
    a-b
end

def sum a
    total = 0
    a.each do |num|
        total += num
    end
    total
end

def multiply a, *args
    args.reduce(a) { |o, x| o*x}
end

def power a, b
    a**b
end

def factorial a
    total = 1
    while a > 1
        total *= a
        a -= 1
    end
    total
end