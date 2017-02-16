class MinHeap

  attr_accessor :store

  def initialize
    @store = [nil]
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
  end
end

b = MinHeap.new
arr = [0, 10, 3, 6, 4, 5]
MinHeap.heapify_down(arr, 1)
p arr
