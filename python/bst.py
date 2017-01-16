class Node(object):
    def __init__(self, val, left=None, right=None, parent=None):
        self.data = val
        self.left = left
        self.right = right
        self.parent = parent

    def die(self):
        if self.data > self.parent.data:
            self.parent.right = None
            self = None
        else:
            self.parent.left = None
            self = None

    def hasLeftChild(self):
        return True if self.left != None else False

    def hasRightChild(self):
        return True if self.right != None else False

    def hasBothChildren(self):
        return self.hasLeftChild() and self.hasRightChild()

    def hasParent(self):
        return True if self.right != None else False

    def hasNoChildren(self):
        return True if self.left == None and self.right == None else False

class BST(object):

    def __init__(self):
        self.root = None

    def insert(self, val):
        if self.root == None:
            self.root = Node(val)
        else:
            self.__insert(val, self.root)

    def __insert(self, val, current):
        if val <= current.data:
            if current.hasLeftChild():
                self.__insert(val, current.left)
            else:
                current.left = Node(val, parent=current)
        else:
            if current.hasRightChild():
                self.__insert(val, current.right)
            else:
                current.right = Node(val, parent=current)

    def delete(self, val, root=None):
        if root is None:
            return root
        if val < root.data:
            root.left = self.delete(val, root.left)
        elif val > root.data:
            root.right = self.delete(val, root.right)
        else:
            if root.left is None:
                temp = root.right
                root = None
                return temp
            elif root.right is None:
                temp = root.left
                root = None
                return temp
            temp = self.__inorder_successor(root.right)
            root.data = temp.data
            root.right = self.delete(temp.data, root.right)
        return root

    def __inorder_successor(self, current):
        node = current
        while (node.left is not None):
            node = node.left
        return node

    def find(self, val, current):
        if current == None:
            raise KeyError('Value not in tree')
        elif current.data == val:
            return current
        else:
            if current.data >= val:
                return self.find(val, current.left)
            else:
                return self.find(val, current.right)


    def preorder(self, current):
        if current == None:
            return
        else:
            print current.data,
            self.preorder(current.left)
            self.preorder(current.right)

    def inorder(self, current):
        if current == None:
            return
        else:
            self.inorder(current.left)
            print current.data,
            self.inorder(current.right)

    def postorder(self, current):
        if current == None:
            return
        else:
            self.postorder(current.left)
            self.postorder(current.right)
            print current.data,

b = BST()
b.insert(5)
b.insert(3)
b.insert(7)
b.insert(1)
b.insert(4)
b.insert(6)
b.insert(8)
b.postorder(b.root)
b.delete(3, b.root)
print ""
b.postorder(b.root)
