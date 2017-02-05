class Node

  attr_accessor :val, :next, :prev

  def initialize(val=nil, nex=nil, prev=nil)
    @val = val
    @next = nex
    @prev = prev
  end

  def remove
    @next.prev = @prev if @prev
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

  def first
    @head
  end

  def add(val)
    new_node = Node.new(val)
    if @head.nil?
      @head = new_node
      @tail = @head
    else
      new_node.prev = @tail
      @tail.next = new_node
      @tail = new_node
    end
    new_node
  end

  def remove(val)
    if @head.val == val
      victim = @head
      @head = @head.next
      @tail = nil if @head.nil?
      victim
    elsif @tail.val == val
      victim = @tail
      @tail = @tail.prev
      @tail.next = nil
      @head = nil if @tail.nil?
      victim
    else
      each do |link|
        if link.val == val
          link.remove
          return link
        end
      end
    end
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

end

l = LinkedList.new
l.add(1)
l.add(2)
l.add(3)
l.remove(3)
l.remove(2)
l.remove(1)
l.show
