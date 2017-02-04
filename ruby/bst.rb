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
    if val == @root.val
      if @root.right.nil?
        @root = @root.left
      elsif @root.left.nil?
        @root = @root.right
      else
        temp = __inorder_successor(@root.right)
        @root.val = temp.val
        __delete(@root.val, @root.right)
      end
    else
      __delete(val, @root)
    end
  end

  def kth_largest(k)
    __inorder_array(@root, [])[-k]
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
    return node if node.nil?
    if val < node.val
      node.left = __delete(val, node.left)
    elsif val > node.val
      node.right = __delete(val, node.right)
    else
      if node.right.nil?
        temp = node.left
        node = nil
        return temp
      elsif node.left.nil?
        temp = node.right
        node = nil
        return temp
      else
        temp = __inorder_successor(node.right)
        node.val = temp.val
        node.right = __delete(node.val, node.right)
      end
    end
    return node
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
b << 6
p b.kth_largest(1)
