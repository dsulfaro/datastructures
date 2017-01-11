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
  std::cout << "Item not added to list\n";
  return false;
}

bool LinkedList::pop() {

  if (length == 0) {
    std::cout << "List is empty" << std::endl;
    return false;
  }
  else {
    if (length == 1) {
      head = new Node;
      length = 0;
      return true;
    }
    else {
      Node * p = head->next;
      Node * q = head;
      while (p->next) { p = p->next; q = q->next; }
      delete p;
      q->next = nullptr;
      length--;
      return true;
    }
  }
  return false;
}

void LinkedList::print() {
  if (length == 0) {
    std::cout << "List is empty" << std::endl;
    return;
  }
  Node * ptr = head;
  while (ptr != nullptr) {
    std::cout << ptr->data << " ";
    ptr = ptr->next;
  }
  std::cout << std::endl;
}

int LinkedList::size() {
  return length;
}
