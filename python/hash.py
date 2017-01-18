from linked_list import LinkedList

class Hash(object):

    def __init__(self):
        self.store = [None] * 8
        self.size = 8
        self.longest = 0


    def insert(self, key, val):
        if self.__bad_types(key, val):
            return False
        bucket = self.__hash(key)
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
        return False


    def __check_longest_list(self, bucket):
        if self.store[bucket].length > self.longest:
            self.longest = self.store[bucket].length
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
        return None

    def __setitem__(self, key, val):
        bucket = self.__hash(key)
        if self.insert(key, val):
            return True
        else:
            return False

    def need_to_resize(self):
        return

    def resize(self):
        return

h = Hash()
h['a'] = 1
print h['a']
h['a'] = 69
print h['a']
