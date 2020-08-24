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

    def to_s

        puts preOrder(@root)
        
    end

end

x = Tree.new([1,2,3,4,5,6,7])

puts x.to_s
