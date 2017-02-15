class Node {

  constructor(val=null, next=null) {
    this.val = val
    this.next = next
  }

}

class LinkedList {

  constructor() {
    this.head == null

    this.add = this.add.bind(this);
    this.render = this.render.bind(this);
  }

  add(val) {
    if (this.head == null ) {
      this.head = new Node(val)
    }
    else {
      let curr = this.head
      while (curr.next != null) { curr = curr.next }
      curr.next = new Node(val)
    }
  }

  handleInput(e) {
    if (e.keyCode === 13 && e.currentTarget.value != "") {
      console.log(e.currentTarget.value)
      this.add(e.currentTarget.value)
      document.getElementById("ll-add").value = ""
      this.render()
    }
  }

  render() {
    let start = document.getElementById("list")
    start.innerHTML = '';
    let curr = this.head
    while (curr !== null) {
      let node = document.createElement("DIV")
      node.innerHTML = curr.val
      start.appendChild(node)
      curr = curr.next
    }
  }
}

document.addEventListener("DOMContentLoaded", () => {

  list = new LinkedList()

  document.getElementById("ll-add").addEventListener("keydown", e => list.handleInput(e));
});
