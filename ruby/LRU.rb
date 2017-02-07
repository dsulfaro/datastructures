require_relative "./linked_list.rb"

class LRU

  attr_accessor :map, :store

  def initialize(size)
    @store = LinkedList.new
    @map = Hash.new
    @max = size
  end

  def get(val)
    if @map[val]
      # get it
      # remove it from list
      # put it back on end
      link = @map[val]
      reorder!(link)
    else
      # add to list (which creates a link)
      # add that link and its val to hash (val -> link)
      # pop of first val in linked list if it's too long
      link = @store.add(val)
      @map[val] = link
      eject! if @map.size > @max
    end
  end

  def show
    @store.show
    puts ""
    p @map.keys
  end

  private

  def reorder!(link)
    @store.remove(link.val)
    @store.add(link.val)
  end

  def eject!
    victim = @store.first.val
    @store.remove(victim)
    @map.delete(victim)
  end


end

l = LRU.new(4)
l.get(1)
l.get(2)
l.get(3)
l.get(4)
l.get(5)
l.show
