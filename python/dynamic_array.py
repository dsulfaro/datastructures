class StaticArray(object):
    def __init__(self, size):
        self.size = size
        self.store = [None] * size
        self.idx = 0

    def __setitem__(self, idx, val):
        if self.__checkidx__(idx):
            return
        self.store[idx] = val

    def __getitem__(self, idx):
        if self.__checkidx__(idx):
            return
        return self.store[idx]

    def push(self, val):
        if self.idx == self.size:
            return False
        else:
            self.store[self.idx] = val
            self.idx += 1
            return True

    def pop(self):
        if self.idx == 0:
            return False
        else:
            self.idx -= 1
            self.store[self.idx] = None
            return True

    def __checkidx__(self, idx):
        if idx < 0 or idx >= self.size:
            print "Error: Index out of range"
            return True

class DynamicArray(object):
    def __init__(self):
        self.store = StaticArray(8)
        self.size = 8
        self.ring = 8
        self.pushed = 0

    def display(self):
        for i in range(self.ring, self.size):
            print self.store[i],
        for i in range(0, self.ring):
            if self.store[i] == None:
                break
            print self.store[i],

    def push(self, val):
        if self.__check_collision():
            self.__resize()
        if self.store.push(val):
            self.pushed += 1
            return True
        else:
            return False

    def pop(self):
        return

    def shift(self):
        return

    def unshift(self):
        return

    def check(self):
        return

    def __resize(self):
        front = []
        back = []
        for i in range(self.ring):
            front.append(self.store[i])
        for j in range(self.ring, self.size):
            back.append(self.store[j])
        self.size *= 2
        new_store = StaticArray(self.size)
        for el in front:
            new_store.push(el)
        it = self.size - 1
        for el in list(reversed(back)):
            self.store[it] = el
            it -= 1
        self.store = new_store
        self.ring += self.size / 2


    def __check_collision(self):
        if self.pushed == self.ring:
            return True
        else:
            return False

arr = DynamicArray()
arr.display()
