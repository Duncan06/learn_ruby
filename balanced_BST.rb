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

    def inorder(root=@root, list=[])

        if root == nil || root.data == nil

            return

        end

        inorder(root.left, list)

        list << root.data

        inorder(root.right, list)

        return list

    end

    def preorder(root=@root, list=[])

        if root == nil || root.data == nil

            return

        end

        list << root.data

        preorder(root.left, list)

        preorder(root.right, list)

        return list

    end

    def postorder(root=@root, list=[])

        if root == nil || root.data == nil

            return

        end

        postorder(root.left, list)

        postorder(root.right, list)

        list << root.data

        return list

    end

    def height(node)

        place = locate(node)

        highest = count_height(place)

    end

    def locate(node, root=@root)

        while root.data != node

            if node < root.data

                root = root.left

            else 

                root = root.right

            end

        end

        root
    
    end

    def count_height(descend, count=0, current_best=0)

        if descend.left != nil 

            descend = descend.left

            count += 1

            p "current count #{count}, current data #{descend.data} From left"

            value = count_height(descend, count, current_best)

            if value > current_best

                current_best = value

            end

        end

        if descend.right != nil

            descend = descend.right

            count += 1

            p "current count #{count}, current data #{descend.data} From right"

            value = count_height(descend, count, current_best)

            if value > current_best

                current_best = value

            end

        end

        if count > current_best

            current_best = count

        end

        p "current best #{current_best}, current data #{descend.data}"

        current_best

    end

    def find_depth(node, count_to_node=0)

        while count_to_node == 0

            count_to_node = depth(node, count_to_node, @root)

        end

        count_to_node

    end

    def depth(node, count_to_node, descend, count=0)

        p "This is descend currently #{descend}, and it's left #{descend.left}"

        if descend.left != nil 

            descend = descend.left

            count += 1

            p "current count #{count}, current data #{descend.data} From left"

            if descend.data == node

                count_to_node = count

            end

            depth(node, count_to_node, descend, count)

        end

        if descend.right != nil

            descend = descend.right

            count += 1

            p "current count #{count}, current data #{descend.data} From right"

            if descend.data == node

                count_to_node = count

            else

                count_to_node = depth(node, count_to_node, descend, count)

            end

        end

        count_to_node

    end


end

x = Tree.new([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15])

# puts x.to_s

p x.postorder

p x.preorder

p x.inorder

p x.find_depth(12)
