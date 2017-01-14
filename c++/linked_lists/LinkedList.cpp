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
  std::cout << "Couldn't pop" << std::endl;
  return false;
}

bool LinkedList::insert(int value, int position) {
  if (position < 0 || position > length + 1) {
    std::cout << "Invalid position" << std::endl;
  }
  else {
    if (position == length) {
      this->push(value);
    }
    else if (position == 0) {
      Node * n = new Node;
      n->data = value;
      Node * temp = head;
      head = n;
      head->next = temp;
      return true;
    }
    else {
      Node * p = head;
      Node * q = head->next;
      while (position > 1) {
        p = p->next;
        q = q->next;
        position--;
      }
      Node * n = new Node;
      n->data = value;
      n->next = q;
      p->next = n;
      return true;
    }
  }
  return true;
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
