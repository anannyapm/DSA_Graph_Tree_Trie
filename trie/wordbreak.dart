int ALPHABET_SIZE = 26;

class Node {
  List<Node?> children = List.filled(ALPHABET_SIZE, null);
  bool eow = false;
}

//empty root node
Node? root = Node();

void insert(String word) {
  Node? curr = root;

  for (int i = 0; i < word.length; i++) {
    int idx = word[i].codeUnits[0] - 'a'.codeUnits[0];

    if (curr?.children[idx] == null) {
      //add new node
      curr?.children[idx] = Node();
    }
    if (i == word.length - 1) {
      curr?.children[idx]?.eow = true;
    }
    curr = curr?.children[idx];
  }
}

bool search(String word) {
  Node? curr = root;
  for (int i = 0; i < word.length; i++) {
    int idx = word[i].codeUnits[0] - 'a'.codeUnits[0];
    Node? node = curr?.children[idx];
    if (node == null) {
      return false;
    }
    if (i == word.length - 1 && node.eow == false) {
      return false;
    }
    curr = node;
  }
  return true;
}

bool wordBreak(String key) {
  if (key.length == 0) {
    return true;
  }
  for (int i = 1; i <= key.length; i++) {
    String firstpart = key.substring(0, i);
    String secondpart = key.substring(i);
    if (search(firstpart) && wordBreak(secondpart)) {
      return true;
    }
  }
  return false;
}

void main(List<String> args) {
  List<String> words = ["i", "like", "samsung", "mobile", "ice"];
  for (int i = 0; i < words.length; i++) {
    insert(words[i]);
  }
  String key = "ilikesung";
  print(wordBreak(key));
}
