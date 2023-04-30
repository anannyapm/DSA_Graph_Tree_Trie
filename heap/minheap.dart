import 'dart:io';

class Heap {
  List<int> arr = [];

  void insert(int data) {
    arr.add(data);
    int index = arr.length - 1;

    int parent = parentnode(index); // take index of currently added value and find parent
    while (index != 0 && arr[parent] > arr[index]) {
      swap(index, parent);
      index = parent; //set index as current parent idx
      parent =
          parentnode(index); // get new parent set to parent of current index
    }
    //while will run log n times and ie number of levels times will be the traversal here
  }

  int delete() {
    //deletes the top most value ie here minumum
    //get last index element and swap it with top

    int data = arr[0];

    swap(0, arr.length - 1);

    //remove last element

    arr.removeLast();

    //fix the heap such that minheap property is satified -- we will use heapify here

    _heapify(0);
    return data;
  }

  void _heapify(int index) {
    //O(log n)
    //take root, find its left and right child.
    int left = leftchild(index);
    int right = rightchild(index);
    int minIdx = index;
    //compare left and right child with minidx and find min. Make that min parent.

    //left<arr.length means check for leaf node, those wont have left and right
    //in such cases index will be greater than length of array.
    if (left < arr.length && arr[minIdx] > arr[left]) {
      minIdx = left;
    }

    if (right < arr.length && arr[minIdx] > arr[right]) {
      minIdx = right;
    }

    if (minIdx != index) {
      swap(minIdx, index);
      _heapify(minIdx);
    }
  }

  int peek() {
    return arr.elementAt(0);
  }

  void display() {
    if (!isEmpty()) {
      for (int i = 0; i < arr.length; i++) {
        stdout.write("${arr[i]} ");
      }
    }
  }

  swap(int val1, int val2) {
    int temp = arr[val1];
    arr[val1] = arr[val2];
    arr[val2] = temp;
  }

  int parentnode(int idx) {
    return (idx - 1) ~/ 2;
  }

  int leftchild(int idx) {
    return 2 * idx + 1;
  }

  int rightchild(int idx) {
    return 2 * idx + 2;
  }

  bool isEmpty() {
    return arr.length == 0;
  }
}

void main(List<String> args) {
  Heap h = Heap();
  h.insert(3);
  h.insert(10);
  h.insert(28);
  h.insert(12);
  h.insert(22);
  h.insert(24);
  h.display();

  print("\ndeleting.....");
  while (!h.isEmpty()) {
    print("${h.peek()} ");
    h.delete();
  }
}
