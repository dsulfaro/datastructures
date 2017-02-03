class Node
  attr_accessor :left, :right, :val
  def initialize(left=nil, right=nil, val)
    @left = left
    @right = right
    @val = val
  end
end

class BST

  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(val)
    @root.nil? ? @root = Node.new(val) : __insert(val, @root)
  end

  def inorder(*a)
    return a.size > 0 ? __inorder_array(@root, []) : __inorder_print(@root)
  end

  alias_method :add, :insert
  alias_method :push, :insert
  alias_method :<<, :insert

  def delete(val)

  end

  private

  def __insert(val, node)
    return Node.new(val) if node.nil?
    if val < node.val
      node.left = __insert(val, node.left)
    else
      node.right = __insert(val, node.right)
    end
    node
  end

  def __delete(val, node)

  end

  def __inorder_successor(node)
    curr = node
    until curr.left.nil?
      curr = curr.left
    end
    curr
  end

  def __inorder_print(node)
    return if node.nil?
    __inorder_print(node.left)
    p node.val
    __inorder_print(node.right)
  end

  def __inorder_array(node, result)
    return result if node.nil?
    __inorder_array(node.left, result)
    result << node.val
    __inorder_array(node.right, result)
  end

end

b = BST.new
b << 5
b << 3
b << 7
b << 1
b << 2
b << 6
b << 8
