import 'dart:collection';
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
} //traverse in the order root left right

preorder(Node? root) {
  if (root == null) {
    stdout.write("null ");
    return null;
  }
  stdout.write("${root.data} ");

  preorder(root.left);
  preorder(root.right);
}

//traverse in the order left root right

inorder(Node? root) {
  if (root == null) {
    stdout.write("null ");
    return null;
  }
  inorder(root.left);
  stdout.write("${root.data} ");

  inorder(root.right);
}

//traverse in the order left right root

postorder(Node? root) {
  if (root == null) {
    stdout.write("null ");
    return;
  }
  postorder(root.left);
  postorder(root.right);
  stdout.write("${root.data} ");
}

//levelorder traversal
//using iteration and queue
levelorder(Node? root) {
  Queue<Node?> q = Queue();
  if (root == null) {
    return;
  }
  q.add(root);
  q.add(null);

  while (!q.isEmpty) {
    Node? currNode = q.removeFirst();
    if (currNode == null) {
      print('');
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
  List<int> nodes = [1, 2, 4, -1, -1, 5, -1, -1, 3, -1, 6, -1, -1];
  BinaryTree tree = BinaryTree();
  Node root = tree.buildTree(nodes);
  print("\nPreorder Traversal");

  preorder(root);
  print("\nInorder Traversal");
  inorder(root);
  print("\nPostorder Traversal");
  postorder(root);

  print("\nlevel order");
  levelorder(root);
}
