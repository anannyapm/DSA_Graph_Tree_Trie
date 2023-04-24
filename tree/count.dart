import 'dart:io';

class Node {
  int data;
  Node? left;
  Node? right;

  Node({required this.data});
}

class BinaryTree {
  int index = -1;

  //recursively create nodes -- preorder insertion ie root left right
  buildTree(List<int> nodes) {
    index++;
    if (nodes[index] == -1) {
      return null;
    }
    Node newnode = Node(data: nodes[index]);
    newnode.left = buildTree(nodes);
    newnode.right = buildTree(nodes);
    return newnode;
  }
}

//recursively call count of nodes on subtrees. recursion has the stopping condition as return 0 when null encountered
//complexity O(n) as every node is visited
int countOfNode(Node? root) {
  if (root == null) {
    return 0;
  }
  int leftnodes = countOfNode(root.left); 
  int rightnodes = countOfNode(root.right);

  return leftnodes + rightnodes + 1;
}

void main(List<String> args) {
  List<int> nodes = [1, 2, 4, -1, -1, 5, -1, -1, 3, -1, 6, -1, -1];
  BinaryTree tree = BinaryTree();
  Node root = tree.buildTree(nodes);

  print("Count of nodes = ${countOfNode(root)}");
}
