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

    def least(root=@root)

        if root.left == nil

            root.data

        else

            least(root.left)

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

        if path.data > value

            path.left = delete(path.left, value)

        elsif path.data < value

            path.right = delete(path.right, value)

        else

            
            if path.left == nil

                temp = Node.new(path.right)

                return temp

            elsif path.right == nil

                temp = Node.new(path.left)

                return temp

            end

            temp = least(path.right)

            temp = Node.new(temp)

            path.data = temp.data

            path.right = delete(path.right, temp.data)

        end

        return path

    end

    def find(node = nil, value)

        if value < @root.data && @root.left != nil

            node = @root.left

            find(node, value)

        elsif value > @root.data && @root.right != nil

            node = @root.right

            find(node, value)

        elsif value == @root.data

            return node.to_s

        else

            puts "Value not in tree."

        end

    end

    def to_s(root=@root)

        puts preOrder(root)
        
    end

end

x = Tree.new([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15])

puts x.to_s

puts x.find(10)

