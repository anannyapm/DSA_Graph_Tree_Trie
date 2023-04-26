import 'dart:io';

class Node {
  int data;
  Node? left;
  Node? right;

  Node({required this.data});
}

//returns node where its inserted
Node? insert(Node? currNode, int val) {
  //complexity - O(H)
  if (currNode == null) {
    currNode = Node(data: val);
    return currNode;
  }
  if (currNode.data > val) {
    //returns the left subtree after insertion
    currNode.left = insert(currNode.left, val);
  } else {
    //returns right subtree after insertion
    currNode.right = insert(currNode.right, val);
  }

  return currNode;
}

Node? delete(Node? currNode, int val) {
  if (currNode == null) {
    return currNode;
  }
  if (currNode.data > val) {
    currNode.left = delete(currNode.left, val);
  } else if (currNode.data < val) {
    currNode.right = delete(currNode.right, val);
  } else {
    //root.data==val
    //case1
    if (currNode.left == null && currNode.right == null) {

      return null;
    }
    //case 2
    if (currNode.left == null) {
   

      return currNode.right;
    }
    if (currNode.right == null) {
    

      return currNode.left;
    }
    //case 3
 

    Node? iSuccessor = inorderSuccessor(currNode.right!);
    currNode.data = iSuccessor!.data;
    currNode.right = delete(currNode.right, iSuccessor.data);
  }
  return currNode;
}

Node? inorderSuccessor(Node currNode) {
  while (currNode.left != null) {
    currNode = currNode.left!;
  }
  return currNode;
}

void inorder(Node? currNode) {
  if (currNode == null) {
    return null;
  }
  inorder(currNode.left);
  stdout.write("${currNode.data} ");
  inorder(currNode.right);
}

void main(List<String> args) {
  List values = [8, 5, 3, 1, 4];

  Node? root = null;

  for (int i = 0; i < values.length; i++) {
    root = insert(root, values[i]);
  }
  inorder(root);
  root=delete(root, 4);
  print("\nAfter removal");
  inorder(root);
  root=delete(root, 1);
  print("\nAfter removal");
  inorder(root);
  root=delete(root, 3);
  print("\nAfter removal");
  inorder(root);
  root=delete(root, 5);
  print("\nAfter removal");
  inorder(root);
  root=delete(root, 8);
  print("\nAfter removal");
  inorder(root);

}
