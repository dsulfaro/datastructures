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
            print "Error: Array full"
        else:
            self.store[self.idx] = val
            self.idx += 1

    def pop(self):
        if self.idx == 0:
            print "Error: Array empty"
        else:
            self.idx -= 1
            self.store[self.idx] = None

    def __checkidx__(self, idx):
        if idx < 0 or idx >= self.size:
            print "Error: Index out of range"
            return True

class DynamicArray(object):
    def __init__(self):
        self.store = []
        self.size = 8

    def push(self, val):

    def pop(self):

    def shift(self):

    def unshift(self):

    def check(self):

    def resize(self):
