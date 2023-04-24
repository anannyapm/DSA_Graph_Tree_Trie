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


//height of node
//complexity - O(n)
int height(Node? root) {
  if (root == null) {
    return 0;
  }
  int leftheight = height(root.left);
  int rightheight = height(root.right);
  return max(leftheight, rightheight) +
      1; // adding one to take into account the edge to root
}

//diameter height

int diameter(Node? root) {
  if (root == null) {
    return 0;
  }
  int diam1 = diameter(root.left);
  int diam2 = diameter(root.right); //==> these both lines runs n times
  int diam3 = height(root.left) +
      height(root.right) +
      1; //==> here height calculation takes n times
  //overall O(n^2)
  return max(diam3, max(diam1, diam2));
}

class TreeInfo {
  int height;
  int diam;

  TreeInfo({required this.height, required this.diam});
}

TreeInfo diameter2(Node? root) {
  //O(n)
  if (root == null) {
    return TreeInfo(height: 0, diam: 0);
  }

  TreeInfo left = diameter2(root.left);
  TreeInfo right = diameter2(root.right);

  int heightval = max(left.height, right.height) + 1;
  int diam1 = left.diam;
  int diam2 = right.diam;
  int diam3 = left.height + right.height + 1;

  int diamval = max(diam3, max(diam1, diam2));
  TreeInfo treeval = TreeInfo(height: heightval, diam: diamval);
  return treeval;
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
  print("height is ${height(root)}");
  print("diameter is ${diameter(root)}");
  print("diameter2 is ${diameter2(root).diam}");
}
