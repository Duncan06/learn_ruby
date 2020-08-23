class LinkedList

    def initialize

        @listhead = nil

        @listtail = nil

    end

    def append(value)

        unit = Node.new(nil, value, nil)

        if @listhead == nil 

            @listhead = unit

            @listtail = unit

            return

        else

            @listtail.tail = unit

            unit.head = @listtail

            @listtail = unit

        end

    end

    def prepend(value)

        unit = Node.new(nil, value, nil)

        unit.tail = @listhead

        @listhead.head = unit

        @listhead = unit

    end

    def size

        count = 1

        found = false

        node = @listhead

        until node.tail == nil

            node = @listhead.tail

            count += 1

        end

        return count

    end

    def head

        puts @listhead.value

    end
    
    def tail

        puts @listtail.value

    end

    def at(index)

        count = 0

        node = @listhead

        until count >= index

            node = node.tail

            count += 1

        end

        if node == nil

            puts "nil"

            return

        end

        p node.value
            
        return

    end

    def pop

        @listtail = @listtail.head

        @listtail.tail = nil

    end
    

    def contains?(value)

        found = false

        node = @listhead

        until node.tail == nil

            if node.value == value

                found = true

            end

        end

        return found

    end

    def find(value)

        count = 0

        found = false

        node = @listhead

        until node.tail == nil

            if node.value == value

                found = true

            end

            count += 1

            node = node.tail

        end

        puts count

    end

    def to_s

        node = @listhead

        until node == nil

            print "(#{node.value}) -> "

            node = node.tail

        end

        print "nil \n"

    end 

    def insert_at(value, index)

        count = 0

        found = false

        node = @listhead

        until count == index

            node = node.tail

            count += 1

        end

        unit = Node.new(node.head, value, node)

        node.head = unit

        unit.head.tail = unit

    end

    def remove_at(index)

        count = 0

        found = false

        node = @listhead

        until count == index

            node = node.tail

            count += 1

        end

        node.head.tail = node.tail

    end

end

class Node

    attr_accessor :head, :value, :tail

    def initialize(head, value, tail)

        @head = head

        @value = value

        @tail = tail

    end

end

test1 = "pork"

test2 = "beans"

total = LinkedList.new

total.append(test1)

total.append(test2)

total.to_s

total.find("beans")

total.insert_at("more", 1)

total.to_s

total.remove_at(1)

total.to_s