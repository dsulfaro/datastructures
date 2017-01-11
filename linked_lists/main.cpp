#include "LinkedList.h"
using namespace std;

int main() {

  LinkedList list;
  list.push(1);
  list.print();
  list.pop();
  list.print();

  list.push(1);
  list.push(2);
  list.print();
  list.pop();
  list.print();
  list.pop();
  list.print();
  list.pop();

  return 0;

}
