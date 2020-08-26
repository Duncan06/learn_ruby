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

    def min_value(root)

        if root.left == nil

            root.data

        else

            min_value(root.left)

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

    def delete(path=@root, value)

        if path == nil

            return path

        end

        p path.data, value, "here"

        if path.data > value

            path.left = delete(path.left, value)

        elsif path.data < value

            path.right = delete(path.right, value)

        else

            
            if path.left == nil

                p "here 3"

                temp = Node.new(path.right)

                return temp

            elsif path.right == nil

                p "here 2"

                temp = Node.new(path.left)

                return temp

            end

            temp = min_value(path.right)

            temp = Node.new(temp)

            path.data = temp.data

            path.right = delete(path.right, temp.data)

        end

        return path

    end

    def to_s

        puts preOrder(@root)
        
    end

end

x = Tree.new([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15])

puts x.to_s

x.delete(6)

x.delete(11)

puts x.to_s
