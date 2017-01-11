#include <iostream>

class SinglyLinkedList {

    struct Node {
      int data;
      Node * next;
      Node(int data, Node * next) : data(data), next(next) {}
    };

  public:

    Node * head;

    SinglyLinkedList() : head(nullptr) {};

    void append(int val, int position = 0) {
      if (position == 0) {
        head = new Node(val, head->next);
      }
      else {

      }
  };

  void print() {
    Node * ptr = head;
    if (!ptr) { std::cout << "List is empty!" << std::endl; }
    else {
      std::cout << ptr->data;
      while (ptr) {
        std::cout << ", ";
        ptr = ptr->next;
        std::cout << ptr->data;
      }
    }
  }

};

int main() {
  SinglyLinkedList * list = new SinglyLinkedList();
  return 0;
}
