class MinHeap

  attr_accessor :store

  def initialize
    @store = [nil]
  end

  def add(val)
    @store << val
    self.class.heapify_up(@store, @store.length - 1)
  end

  alias_method :<<, :add
  alias_method :push :add

  def peek
    @store[1]
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

  def self.heapify_down(arr, par)
    children = MinHeap.children(par, arr)
    return if children.empty?
    if arr[par] > children[0]
      arr[par], arr[children[0]] = arr[children[0]], arr[par]
      MinHeap.heapify_down(arr, children[0])
    elsif arr[par] > children[1]
      arr[par], arr[children[1]] = arr[children[1]], arr[par]
      MinHeap.heapify_down(arr, children[1])
    else
      return
    end
  end

  def self.heapify_up(arr, child)
    parent = MinHeap.parent(child, arr)
    return if parent.empty?
    if arr[parent.first] > arr[child]
      arr[parent.first], arr[child] = arr[child], arr[parent.first]
      MinHeap.heapify_up(arr, parent.first)
    else
      return
    end
  end
end

b = MinHeap.new
b << 5
b << 6
b << 7
b << 8
b << 9
b << 1
b.print
