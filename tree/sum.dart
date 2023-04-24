import 'dart:collection';
import 'dart:io';
import 'dart:math';

class Node {
  int data;
  Node? left;
  Node? right;

  Node({required this.data});
}

class BinaryTree {
  generateTree() {
    Node? root = Node(data: 1);
    root.left = Node(data: 2);
    root.right = Node(data: 3);
    root.left?.left = Node(data: 4);
    root.left?.right = Node(data: 5);
    root.right?.right = Node(data: 6);
    root.right?.right?.right = Node(data: 7);
    return root;
  }
}

//sumofnode

int sumOfNodes(Node? root) {
  if (root == null) {
    return 0;
  }
  int leftsum = sumOfNodes(root.left);
  int rightsum = sumOfNodes(root.right);
  return leftsum + rightsum + root.data;
}



levelOrder(Node? root) {
  Queue q = Queue();

  q.add(root);
  q.add(null);

  while (!q.isEmpty) {
    Node? currNode = q.removeFirst();
    if (currNode == null) {
      print("");
      if (q.isEmpty) {
        break;
      } else {
        q.add(null);
      }
    } else {
      stdout.write("${currNode.data} ");
      if (currNode.left != null) {
        q.add(currNode.left);
      }
      if (currNode.right != null) {
        q.add(currNode.right);
      }
    }
  }
}

void main(List<String> args) {
  BinaryTree bt = BinaryTree();
  Node? root = bt.generateTree();
  levelOrder(root);
  print("sum of nodes: ${sumOfNodes(root)}");
 
}
