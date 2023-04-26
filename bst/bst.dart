import 'dart:io';

class Node {
  int data;
  Node? left;
  Node? right;

  Node({required this.data});
}

//returns node where its inserted
Node? insert(Node? root, int val) {

  //complexity - O(H)
  if (root == null) {
    root = Node(data: val);
    return root;
  }
  if (root.data > val) {
    //returns the left subtree after insertion
    root.left = insert(root.left, val);
  } else {
    //returns right subtree after insertion
    root.right = insert(root.right, val);
  }

  return root;
}

void inorder(Node? root) {
  if (root == null) {
    return null;
  }
  inorder(root.left);
  stdout.write("${root.data} ");
  inorder(root.right);
}

void main(List<String> args) {
  List values = [5, 1, 3, 4, 2, 7];

  Node? root = null;

  for (int i = 0; i < values.length; i++) {
    root = insert(root, values[i]);
  }
  inorder(root);
}
