// nlog(n)

swap(int val1, int val2, List<int> arr) {
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

heapSort(List<int> arr) {
  //Step 1- build maxheap from array
  int n = arr.length;

  //starting from the bottommost non leafnodes till root, heapify each nodes
  for (int i = n ~/ 2; i >= 0; i--) {
    heapify(arr, i, n);
    
  }
  print("heapified $arr");
  //Step 2 push largest to the end
  //using a for loop to swap ith and top element is equivalent to deleteting and keeping deleted elements to last
  for (int i = n - 1; i > 0; i--) {
    swap(i, 0, arr);
    //heapify to re arrange heap again so that we get the next heap
    heapify(arr, 0, i);
  }
}

heapify(List<int> arr, int index, int size) {
  int left = leftchild(index);
  int right = rightchild(index);
  int maxIdx = index;
  if (left < size && arr[left] < arr[maxIdx]) {
    maxIdx = left;
  }

  if (right < size && arr[right] < arr[maxIdx]) {
    maxIdx = right;
  }

  if (maxIdx != index) {
    swap(maxIdx, index, arr);

    heapify(arr, maxIdx, size);
  }
}

void main(List<String> args) {
  List<int> arr = [12,4,85,1,2,6,45];

  heapSort(arr);

  print("Sorted in descending order $arr");
}
