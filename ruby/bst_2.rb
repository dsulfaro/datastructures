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

end

b = BST.new
b << 8
b << 7
b << 10
b << 2
b << 13
p b.dead_end
