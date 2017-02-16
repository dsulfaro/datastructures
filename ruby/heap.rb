class Heap

  def initialize(&prc)
    @store = [nil]
    #MinHeap by default
    @prc = prc || Proc.new { |el1, el2| el2 <=> el1 }
  end

  def self.sort!(arr)
    heap = Heap.new
    arr.each {|x| heap << x}
    result = []
    until result.length == arr.length
      result << heap.remove
    end
    result
  end

  def add(val)
    @store << val
    heapify_up(@store, @store.length - 1)
  end

  alias_method :<<, :add
  alias_method :push, :add

  def remove
    val = @store[1]
    if count > 1
      @store[1] = @store.pop
      heapify_down(@store, 1)
    else
      @store.pop
    end
    val
  end

  alias_method :extract, :remove
  alias_method :>>, :remove

  def peek
    @store[1]
  end

  def count
    @store.size
  end

  def print
    p @store
    puts ""
  end

  private

  def self.children(parent_idx, arr)
    left = parent_idx * 2
    right = parent_idx * 2 + 1
    result = []
    result << left unless arr[left].nil?
    result << right unless arr[right].nil?
    result
  end

  def self.parent(child_idx, arr)
    result = []
    result << child_idx / 2 unless arr[child_idx / 2].nil?
    result
  end

  def heapify_down(arr, par)
    children = Heap.children(par, arr)
    return if children.empty?
    return arr if children.all? { |c| @prc.call(arr[c],arr[par]) <= 0 }
    if @prc.call(arr[par],children[0]) <= 0 && (children[1] != nil && arr[children[0]] < arr[children[1]])
      arr[par], arr[children[0]] = arr[children[0]], arr[par]
      heapify_down(arr, children[0])
    elsif children[1] != nil && @prc.call(arr[par], children[1]) <= 0
      arr[par], arr[children[1]] = arr[children[1]], arr[par]
      heapify_down(arr, children[1])
    else
      return
    end
  end

  def heapify_up(arr, child)
    parent = Heap.parent(child, arr)
    return if parent.empty?
    if @prc.call(arr[parent.first], arr[child]) <= 0
      arr[parent.first], arr[child] = arr[child], arr[parent.first]
      heapify_up(arr, parent.first)
    else
      return
    end
  end
end

b = Heap.new
arr = [4,2,6,1,9,8,3,5]
p Heap.sort!(arr)
