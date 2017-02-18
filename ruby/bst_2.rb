require_relative "./bst.rb"

class BST

  def dead_end()
    hash = hash_nodes
    hash[0] = true
    leaves = get_leaves
    leaves.keys.each do |v|
      return true if hash[v + 1] && hash[v - 1]
    end
    false
  end

  def hash_nodes
    arr = []
    __inorder_array(@root, arr)
    result = {}
    arr.each { |x| result[x] = true }
    result
  end

  def get_leaves
    result = {}
    queue = [@root]
    until queue.empty?
      curr = queue.pop
      result[curr.val] = true if curr.left.nil? && curr.right.nil?
      queue << curr.left if curr.left
      queue << curr.right if curr.right
    end
    result
  end

  def closest(x)
    queue = [@root]
    abs = (@root.val - x).abs
    result = @root.val
    until queue.empty?
      curr = queue.pop
      if (curr.val - x).abs < abs
        result = curr.val
        abs = (curr.val - x).abs
      end
      queue << curr.left if curr.val > x && curr.left
      queue << curr.right if curr.val < x && curr.right
    end
    result
  end

end

b = BST.new
b << 9
b << 4
b << 17
b << 3
b << 6
b << 22
b << 5
b << 7
b << 20
p b.closest(12)
