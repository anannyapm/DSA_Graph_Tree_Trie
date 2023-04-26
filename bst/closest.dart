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

closest(Node? currNode, int val) {
  if (currNode == null) {
    return null;
  }

  int mindiff = double.maxFinite.toInt();
  int closest = currNode.data;

  while (currNode != null) {
    int currdiff = (currNode.data - val).abs();

    if (currdiff < mindiff) {
      mindiff = currdiff;
      closest = currNode.data;
    }

    if (val < currNode.data) {
      currNode = currNode.left;
    } else if (currNode.data < val) {
      currNode = currNode.right;
    } else {
      break;
    }
  }
  return closest;
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
  List values = [6, 1, 2, 7];

  Node? root = null;

  for (int i = 0; i < values.length; i++) {
    root = insert(root, values[i]);
  }
  inorder(root);

  var out = closest(root,3 );
  out == null ? print("\nNo Data") : print("\n$out is the closest");
}
