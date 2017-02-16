class MinHeap

  attr_accessor :store

  def initialize
    @store = []
  end

  private

  def children(parent_idx)
    left = parent_idx * 2
    right = parent_idx * 2 + 1
    result = []
    result << left unless @store[left].nil?
    result << right unless @store[right].nil?
    result
  end

  def parent(child_idx)
    result = []
    result << child_idx / 2 unless @store[child_idx / 2].nil?
    result
  end

end

b = MinHeap.new
