import 'dart:io';

void main(List<String> args) {
  int vertices = 4;
  List v = List.filled(vertices, null);
  for (int j = 0; j < vertices; j++) {
    print("Enter the Vertix value");

    v[j] = int.parse(stdin.readLineSync()!);
  }
  List<List> adjMatrix = List.generate(vertices, (index) => List.filled(4, 0));

  print("\n--------------\nenter number of edges");
  int edges=int.parse(stdin.readLineSync()!);

  for (int i = 0; i < edges; i++) {
    print("enter the source");
    int src = int.parse(stdin.readLineSync()!);
    print("enter the destination");
    int dst = int.parse(stdin.readLineSync()!);
    adjMatrix[v.indexOf(src)][v.indexOf(dst)] = 1;
    adjMatrix[v.indexOf(dst)][v.indexOf(src)] = 1;
  }

  for (int i = 0; i < vertices; i++) {
    print("${v[i]} ${adjMatrix[i]}");
  }
}
