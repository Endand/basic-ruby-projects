module Comparable
   def compare(node)
      if self.val > node.val
         return -1
      else
         return 1
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
end

bst=Tree.new([1,2,3,4,5,6,7])
bst.pretty_print