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

  def seq(s)
    i = [0]
    seq_util(@root, s, i)
    i.first == s.length
  end

  def seq_util(curr, s, i)
    return if curr.nil?
    seq_util(curr.left, s, i)
    if s[i.first] == curr.val
      i[0] += 1
    end
    seq_util(curr.right, s, i)
  end

end

def two_sum(a, b, target)
  avals = a.inorder(1)
  differences = []
  avals.each { |x| differences << target - x }
  queue = [b.root]
  until queue.empty?
    curr = queue.pop
    return true if differences.include?(curr.val)
    queue << curr.left if curr.left
    queue << curr.right if curr.right
  end
  false
end

b = BST.new
b << 1
b << 2
b << 3

a = [1,2,3]
p b.seq(a)
