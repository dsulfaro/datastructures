#include "LinkedList.h"
using namespace std;

int main() {

  LinkedList list;
  list.push(1);
  list.push(2);
  list.push(3);

  list.insert(0, 0);
  list.print();

  return 0;

  // TODO - REMOVE
}
