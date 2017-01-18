class Node(object):

    def __init__(self, val, next=None):
        self.data = val
        self.next = next

    def to_s(self):
        return str(self.data)

    def show(self):
        print str(self.data) + " "
        return

class LinkedList(object):

    def __init__(self):
        self.head = None
        self.length = 0

    def empty(self):
        return True if self.head == None else False

    def push(self, val):
        if self.head == None:
            self.head = Node(val)
        else:
            ptr = self.head
            while ptr.next != None:
                ptr = ptr.next
            ptr.next = Node(val)
        self.length += 1
        return self.head

    def insert(self, val, pos):
        if pos < 0 or pos > self.length:
            print "Invalid position"
        else:
            if pos == 0:
                n = Node(val, self.head)
                self.head = n
            elif pos == self.length:
                self.push(val)
            else:
                prev = self.head
                curr = self.head.next
                while pos != 1:
                    pos -= 1
                    prev = prev.next
                    curr = curr.next
                n = Node(val, curr)
                prev.next = n
            self.length += 1
        return


    def pop(self):
        if self.empty():
            print "List is empty"
        else:
            curr = self.head.next
            prev = self.head
            if curr == None:
                self.head = None
            else:
                while curr.next != None:
                    curr = curr.next
                    prev = prev.next
                prev.next = None
        self.length -= 1
        return

    def delete(self, pos):
        if self.empty():
            print "List is empty"
        if pos >= self.length or pos < 0:
            print "Invalid pos"
        else:
            if pos == 0:
                self.head = self.head.next
            elif pos == self.length - 1:
                self.pop()
            else:
                prev = self.head
                curr = self.head.next
                while pos != 1:
                    pos -= 1
                    prev = prev.next
                    curr = curr.next
                prev.next = curr.next
                curr = None
            self.length -= 1
        return

    def include(self, val):
        ptr = self.head
        while ptr != None:
            if ptr.data == val:
                return True
            else:
                ptr = ptr.next
        return False

    def display(self):
        if self.empty():
            print "List is empty"
        else:
            ptr = self.head
            while ptr != None:
                print ptr.to_s(),
                ptr = ptr.next
            print ""
        return

    def reverse(self):
        if self.empty():
            print "List is empty"
        elif self.length == 1:
            return
        else:
            prev = self.head
            curr = self.head.next
            prev.next = None
            while curr != None:
                temp = curr.next
                curr.next = prev
                prev = curr
                curr = temp
            self.head = prev
        return

    def is_palindrome(self):
        if self.empty():
            print "List is empty"
            return
        elif self.length == 1:
            return True
        else:
            left_total = 0
            right_total = 0
            i = 0
            inc = 0
            ptr = self.head
            while ptr != None:
                if self.length % 2 == 1 and inc == (self.length / 2):
                    inc += 1
                else:
                    if inc < (self.length / 2):
                        i += 1
                        left_total += (i * ptr.data)
                    else:
                        right_total += (i * ptr.data)
                        i -= 1
                inc += 1
                ptr = ptr.next
            return left_total == right_total
