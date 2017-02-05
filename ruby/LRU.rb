require_relative "./linked_list.rb"

class LRU

  attr_accessor :map, :store

  def initialize(size)
    @max = size
    @map = Hash.new
    @store = LinkedList.new
  end

  def get(val)
    if @map[val]
      # get the link
      # remove it from the linked list
      # add it back to the end making the MRU
      link = @map[val]
      reorder!(link)
    else
      # add the link to the end of the linked list
      # add it to the store val => link
      # eject the LRU (front of the list)
      link = @store.add(val)
      @map[val] = link
      eject! if @map.size > @max
    end
  end

  def reorder!(link)
    @store.remove(link.val)
    @store.add(link.val)
  end

  def eject!
    victim = @store.first
    @store.remove(victim.val)
    @map.delete(victim.val)
  end

  def show
    @store.show
    puts ""
    p @map.keys
  end

end
l = LRU.new(4)
l.get(1)
l.get(2)
l.get(3)
l.get(4)
l.get(5)
l.get(1)
l.get(3)
l.show
