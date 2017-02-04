class Node

  attr_accessor :key, :val, :next, :prev

  def initialize(key=nil, val=nil, nex=nil, prev=nil)
    @key = key
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

  def empty?
    @head.nil? && @tail.nil?
  end

  def first
    @head.nil? ? nil : @tail
  end

  def tail
    @tail.nil? ? nil : @tail
  end

  def add(key, val)
    if empty?
      @head = Node.new(key, val)
      @tail = @head
    else
      new_node = Node.new(key, val)
      new_node.prev = @tail
      @tail.next = new_node
      @tail = new_node
    end
  end

  def remove(key)
    if key == @head.key
      @head = @head.next
      @tail = nil if @head.nil?
    elsif key == @tail.key
      @tail = @tail.prev
      @tail.next = nil
      @head = nil if @tail.nil?
    else
      each { |l| l.remove if l.key == key }
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
    each do |l|
      puts "key: #{l.key}, val: #{l.val}"
    end
  end

end

l = LinkedList.new
