import 'dart:io';

class Edge {
  int src;
  int dst;
  Edge({required this.src, required this.dst});
}

void createGraph(List<List<dynamic>> graph) {
  graph[0].add(Edge(src: 0, dst: 2));
  graph[1].add(Edge(src: 1, dst: 2));
  graph[1].add(Edge(src: 1, dst: 3));
  graph[2].add(Edge(src: 2, dst: 0));
  graph[2].add(Edge(src: 2, dst: 1));
  graph[2].add(Edge(src: 2, dst: 3));
  graph[3].add(Edge(src: 3, dst: 1));
  graph[3].add(Edge(src: 3, dst: 2));
}

void transpose(List<List<dynamic>> graph) {
  print("\nTransposing \n-------------");
  for (int i = 0; i < graph.length; i++) {
    for (int j = 0; j < graph[i].length; j++) {
      Edge item = graph[i][j];
      int newsrc = item.dst;
      item.dst = item.src;
      item.src = newsrc;
    }
  }
}

void display(List<List<dynamic>> graph) {
  for (int i = 0; i < graph.length; i++) {
    print("Adjacency list of $i vertex - ");
    for (int j = 0; j < graph[i].length; j++) {
      stdout.write("{${graph[i][j]?.src} , ${graph[i][j]?.dst}} ");
    }
    print("");
  }
}

void main(List<String> args) {
  int V = 4;

  List<List<dynamic>> graph = List.generate(V, (index) => []);
  createGraph(graph);
  display(graph);
  transpose(graph);
  display(graph);
}
