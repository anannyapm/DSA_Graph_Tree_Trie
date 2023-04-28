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
   
    curr = node;
  }
  return true;
}



void main(List<String> args) {
  List<String> words = ["apple","app","mango","man","woman"];
  for (int i = 0; i < words.length; i++) {
    insert(words[i]);
  }

  print(search("app"));
  print(search("moon"));
}
