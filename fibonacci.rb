def fibonacci(x)

    if x == 0 

        return [0]

    elsif x == 1

        return [0,1]

    else

        fibonacci(x-1) << fibonacci(x-1)[-1] + fibonacci(x-1)[-2]

    end

end


def call_fib(x)

    fibonacci(x-1)

end

puts call_fib(5)