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

    def delete(root=@root, k)
      # Base case
      if root.nil?
        return root
      end
    
      # Recursive calls for ancestors of
      # node to be deleted

      if root.val > k
        root.left = delete(root.left, k)
        return root
      elsif root.val < k
        root.right = delete(root.right, k)
        return root
      end
    
      # We reach here when root is the node
      # to be deleted.
    
      # If one of the children is empty
      if root.left.nil?
        temp = root.right
        root = nil
        return temp
      elsif root.right.nil?
        temp = root.left
        root = nil
        return temp
      end
    
      # If both children exist
    
      succ_parent = root
    
      # Find successor
      succ = root.right
      while !succ.left.nil?
        succ_parent = succ
        succ = succ.left
      end
    
      # Delete successor. Since successor
      # is always left child of its parent
      # we can safely make successor's right
      # right child as left of its parent.
      # If there is no succ, then assign
      # succ.right to succ_parent.right
      if succ_parent != root
        succ_parent.left = succ.right
      else
        succ_parent.right = succ.right
      end
    
      # Copy Successor Data to root
      root.key = succ.key
    
      # Delete Successor and return root
      succ = nil
      return root
    end

    def find(root=@root,key)
      return if root.nil?

      return root if root.val==key
      case root.compare(key)
      when 1
         return find(root.right,key)
      when -1 
         return find(root.left,key)
      end
    end

   def level_order
      queue=[@root]
      result=[]
      
      until queue.empty?
         pop=queue.shift
         result << pop.val
         yield pop if block_given?
         queue << pop.left unless pop.left.nil?
         queue << pop.right unless pop.right.nil?
      end
      result
   end

   def inorder(root=@root)
      return if root.nil?

      result=[]

      result.concat(inorder(root.left)) unless root.left.nil?
      yield root if block_given?
      result << root.val
      result.concat(inorder(root.right)) unless root.right.nil?

      block_given? ? nil : result
   end
   def inorder(root=@root)
      return if root.nil?

      result=[]

      result.concat(inorder(root.left)) unless root.left.nil?
      yield root if block_given?
      result << root.val
      result.concat(inorder(root.right)) unless root.right.nil?

      block_given? ? nil : result
   end

   def postorder(root=@root)
      return if root.nil?

      result=[]

      
      result.concat(postorder(root.left)) unless root.left.nil?   
      result.concat(postorder(root.right)) unless root.right.nil?
      yield root if block_given?
      result << root.val

      block_given? ? nil : result
   end

   def height(node)
      return 0 if node.nil? || (node.left.nil? && node.right.nil?)
      left_height=height(node.left)
      right_height=height(node.right)
   
      1 + [left_height,right_height].max
   end

   def depth(node)
      return 0 if node==@root ||node.nil?

      1 + [depth(node.left),depth(node.right)].max

   end

   def balanced(node=@root)
      return true if node.nil? 

      left=height(node.left)
      right=height(node.right)

      return false if (left-right).abs > 1

      balanced(node.left) || balanced(node.right)

   end

   def rebalance
      tree=level_order
      @root=build_tree(tree)
   end
end

bst=Tree.new([1,2,3,4,5,6,7])
bst.insert(8)
bst.insert(9)
bst.pretty_print
bst.inorder
p bst.balanced
bst.rebalance
bst.pretty_print
p bst.balanced