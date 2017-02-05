require './linked_list.rb'

class LRU

  attr_accessor :map, :store

  def initialize(size)
    @map = Hash.new
    @store = LinkedList.new
    @max = size
  end

  def get(key)
    if @map[key]
      link = @map[key]
      update_link!(link)
      return link.val
    else
      new_link = @store.add(key, nil)
      @map[key] = new_link
      eject! if @map.count > @max
    end
  end

  def show
    @store.show
    puts ""
  end

  private

  def update_link!(link)
    @store.remove(link.key)
    @store.add(link.key, link.val)
  end

  def eject!
    v = @store.shift
    @map.delete(v.key)
  end

end

l = LRU.new(4)
l.get('a')
l.get('b')
l.get('c')
l.get('d')
l.show
l.get('e')
l.get('b')
l.get('f')
l.show
