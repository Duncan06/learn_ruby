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

    def find(value)

        node = @root

        while node != nil && node.data != nil

            if value < node.data && node.left != nil

                node = node.left

            elsif value > node.data && node.right != nil

                node = node.right

            elsif value == node.data

                puts preOrder(node)

                return

            end

        end

        puts "Value not in tree."

    end

    def to_s

        puts preOrder(@root)
        
    end

    # def level_order

    #     que = []

    #     list = []

    #     current = nil

    #     until que == [] && list != []

    #         if list == []

    #             list << @root.data

    #             if @root.left != nil

    #                 que << @root.left

    #             end
    
    #             if @root.right != nil
    
    #                 que << @root.right

    #             end

    #         elsif que[0] != nil

    #             current = que.shift

    #             if current.data != nil

    #                 list << current.data

    #             end

    #             if current.left != nil

    #                 que << current.left

    #             end

    #             if current.right != nil

    #                 que << current.right

    #             end

    #         end  

    #     end

    #     return list  

    # end

    def level_order(que=[@root], list=[])

        current = que.shift

        if current.data != nil

            list << current.data

        end

        if current.left != nil

            que << current.left

        end

        if current.right != nil

            que << current.right

        end

        if current.data == nil

            return p list

        end

        level_order(que, list)

    end

        





end

x = Tree.new([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15])

# puts x.to_s

x.level_order

