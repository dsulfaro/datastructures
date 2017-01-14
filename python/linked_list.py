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

    def display(self):
        if self.head == None:
            print "List is empty"
        else:
            ptr = self.head
            while ptr != None:
                print ptr.to_s(),
                ptr = ptr.next
            print ""
        return
