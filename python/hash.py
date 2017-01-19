from linked_list import LinkedList

class Hash(object):

    def __init__(self):
        self.store = [None] * 4
        self.size = 4
        self.longest = 0


    def insert(self, key, val):
        if self.__bad_types(key, val):
            return False
        bucket = self.__hash(key)
        print key, val, bucket
        if self.store[bucket] == None:
            self.store[bucket] = LinkedList()
            self.store[bucket].push([key, val])
        else:
            l = self.store[bucket]
            if not self.__scan_list(l, key, val):
                l.push([key, val])
        self.__check_longest_list(bucket)
        return True

    def __hash(self, str):
        total = 0
        if len(str) != 1:
            total = ord(str[0])
        for c in str:
            total -= ord(c)
            return total % self.size

    def __scan_list(self, l, key, val):
        ptr = l.head
        while ptr != None:
            if ptr.data[0] == key:
                ptr.data[1] = val
                return True
            else:
                ptr = ptr.next
        return False


    def __check_longest_list(self, bucket):
        if self.store[bucket].length > self.longest:
            self.longest = self.store[bucket].length
        self.need_to_resize()
        return

    def __bad_types(self, key, val):
        if type(key) != str or type(val) != int:
            print "Invalid data types!"
            return True
        return False

    def __getitem__(self, key):
        bucket = self.__hash(key)
        if self.store[bucket] == None:
            return None
        ptr = self.store[bucket].head
        while ptr != None:
            if ptr.data[0] == key:
                return ptr.data[1]
            ptr = ptr.next
        return None

    def __setitem__(self, key, val):
        bucket = self.__hash(key)
        if self.insert(key, val):
            return True
        else:
            return False

    def need_to_resize(self):
        if self.longest >= self.size:
            self.resize()
        return

    def resize(self):
        self.size *= 2
        temp = self.store
        self.store = [None] * self.size
        for l in temp:
            if l != None:
                ptr = l.head
                while ptr != None:
                    self.insert(ptr.data[0], ptr.data[1])
                    ptr = ptr.next
        return

    def hash(self, key):
        return self.__hash(key)
