#include "LinkedList.h"

LinkedList::LinkedList() {
  head = new Node();
  length = 0;
}

bool LinkedList::push(int value) {
  if (length == 0) {
    head->data = value;
    length++;
    return true;
  }
  else {
    Node * ptr = head;
    while(ptr->next) { ptr = ptr->next; }
    Node * n = new Node;
    n->data = value;
    n->next = nullptr;
    ptr->next = n;
    length++;
    return true;
  }
  return false;
}



void LinkedList::print() {
  Node * ptr = head;
  while (ptr) {
    std::cout << ptr->data << " ";
    ptr = ptr->next;
  }
  std::cout << std::endl;
}

int LinkedList::size() {
  return length;
}
