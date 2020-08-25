class Node

    include Comparable

    attr_accessor :data, :left, :right

    def initialize(data)

        @data = data

        @left = nil

        @right = nil

    end

    # def <=> (other)

    #     @data <=> other.data

    # end

end

class Tree

    attr_accessor :root

    def initialize(array)

        @array = array.sort.uniq

        @root = build_tree(@array, 0, @array.length)

    end 

    def build_tree(branch, start, last)

        if  (start > last)

            return nil

        end

        mid = ((start + last)/2).floor

        root = Node.new(branch[mid])

        root.left = build_tree(branch, start, mid - 1)

        root.right = build_tree(branch, mid + 1, last)

        return root

    end

    def preOrder(node)

        if node == nil
            
            return

        end

        puts node.data

        preOrder(node.left)

        preOrder(node.right)

    end

    def find(value)

        if @root.data == nil

            false

        end

        if value == @root.data

            true

        elsif value < @root.data 

            find(@root.left)

        elsif value > @root.data

            find(@root.right)

        end

    end

    def insert(value)

        if @root.data == nil

            @root.data = Node.new(value)

            return

        end

        if value < @root.data

            insert(@root.left)

        else 

            insert(@root.right)

        end

    end

    def delete(value)

        if @root.data == value

            if @root.left == nil && @root.right == nil

                @root.data = nil

            elsif @root.left == nil

                @root.data = @root.right.data

                @root.right = nil

            elsif @root.right == nil

                @root.data = @root.left.data

                @root.left = nil

            else 

                

            end

            return

        end

        if value < @root.data

            delete(@root.left)

        else 

            delete(@root.right)

        end

    end

    def to_s

        puts preOrder(@root)
        
    end

end

x = Tree.new([1,2,3,4,5,6,7])

puts x.to_s
