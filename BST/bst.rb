module Comparable
   def compare(val)
      if self.val > val
         return -1
      elsif self.val <= val
         return 1
      else
         return 0
      end
   end
end

class Node
   include Comparable
   attr_accessor :val, :left, :right
   def initialize(val=nil)
      @val=val
      @left=nil
      @right=nil
   end
end

class Tree
   def initialize(arr)
      @root= build_tree(arr)
   end

   def build_tree(arr)
      return nil if arr.empty?
      mid=arr.length / 2
      root=Node.new(arr[mid])
      root.left=build_tree(arr[0...mid])
      root.right=build_tree(arr[mid+1...])
      root

   end

   def pretty_print(node = @root, prefix = '', is_left = true)
      pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
      puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.val}"
      pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end

    def insert(node=@root,key)
      return Node.new(key) if node.nil?
      compare_val=node.compare(key)
      if  compare_val== 0
         return node
      elsif compare_val==1
         node.right=insert(node.right,key)
      else
         node.left=insert(node.left,key)
      end
      return node
    end

    def delete(node=@root,key)
      
    end

end

bst=Tree.new([1,2,3,4,5,6,7])
bst.insert(5)
bst.pretty_print