//****************************************************
// linked_list.h
// linked list implementation and algorithm questions
//****************************************************
// by Daniel Sulfaro

#ifndef LinkedList_h
#define LinkedList_h
#include <iostream>

//****************************************************
// Node structure that describes one link in the list
// I chose to use integers as the data rather than
// templating in order to focus of solving algorithm
// questions easier
//****************************************************
struct Node {
  int data;
  Node * next;
};

//****************************************************
// class for a single LinkedList using node struct
//****************************************************
class LinkedList{

  private:
    Node * head;
    int length;
  public:

    // Default constructor
    LinkedList();

    // adds a number to the end of the list
    bool push(int value);

    // pops the item off end of the list
    bool pop();

    // inserts a value at the given position
    // indexing starts at 0 meaning pushing
    // to the length position of the list
    // counts as the end of the list
    bool insert(int value, int position);

    // prints contents of list
    void print();

    // return size of list
    int size();
};

#endif
