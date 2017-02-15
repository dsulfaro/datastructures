class Node

  attr_accessor :val, :next, :prev

  def initialize(val=nil, nex=nil, prev=nil)
    @val = val
    @next = nex
    @prev = prev
  end

  def remove
    @next.prev = @prev
    @prev.next = @next
    @next = nil
    @prev = nil
  end

end

class LinkedList

  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def add(val)
    new_node = Node.new(val)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next = new_node
      new_node.prev = @tail
      @tail = new_node
    end
    new_node
  end

  def first
    @head
  end

  def remove(val)
    if val == @head.val
      @head = @head.next
      @tail = nil if @head.nil?
    elsif val == @tail.val
      @tail = @tail.prev
      @head = nil if @tail.nil?
      @tail.next = nil
    else
      each do |link|
        if link.val == val
          link.remove
        end
      end
    end
    val
  end

  def each
    curr = @head
    until curr.nil?
      yield curr
      curr = curr.next
    end
  end

  def show
    each do |link|
      puts link.val
    end
  end

  def middle
    x = @head
    y = @head
    while y != nil && y.next != nil
      x = x.next
      y = y.next.next
    end
    x.val
  end

end

l = LinkedList.new
l.add(1)
l.add(2)
l.add(3)
l.add(4)
l.add(5)
p l.middle
