import 'dart:io';

class Node {
  int data;
  Node? left;
  Node? right;

  Node({required this.data});
}

class BinaryTree {
  generateTree() {
    Node? root = Node(data: 13);
    root.left = Node(data: 10);
    root.right = Node(data: 15);
    root.left?.left = Node(data: 7);
    root.left?.left?.right = Node(data: 9);
    root.left?.left?.right?.left = Node(data: 8);
    root.left?.right = Node(data: 14);
    root.right?.left = Node(data: 14);
    root.right?.right = Node(data: 17);
    root.right?.right?.left = Node(data: 16);

    return root;
  }
}

inorder(Node? root) {
  if (root == null) {
    return null;
  }
  inorder(root.left);
  stdout.write("${root.data} ");

  inorder(root.right);
}

bool validate(Node? root, num min, num max) {
  if (root == null) {
    return true;
  }

  //return false is element is either greater than max or lesser than min, ie if element is wrongly placed considering bst
  if (root.data >= max || root.data <= min) {
    return false;
  }

  //if till now above checkings did not return,
  //then it means current node is in the right place. So we will recursivelt check for the
  //left and right subtrees
  //if both validations complete with true, then given tree is a bst
  

  return validate(root.left, min, root.data) &&
      validate(root.right, root.data, max);
}

void main(List<String> args) {
  BinaryTree tree = BinaryTree();
  Node root = tree.generateTree();
  print("\nInorder Traversal");
  inorder(root);
  print("\nIs BST?");
  print(validate(root, -double.maxFinite, double.maxFinite));
}
