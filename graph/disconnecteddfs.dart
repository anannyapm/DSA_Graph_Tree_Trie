
import 'dart:io';

class Edge {
  int src;
  int dst;

  Edge({required this.src, required this.dst});
}

void createGraphNode(List<List<Edge>> graph, source, destination) {
  Edge node = Edge(src: source, dst: destination);
  graph[source].add(node);
}

void display(List<List<Edge>> graph) {
  for (int i = 0; i < graph.length; i++) {
    for (int j = 0; j < graph[i].length; j++) {
      stdout.write("${graph[i][j].src}-> ${graph[i][j].dst},");
    }
  }
  print("\n---------------");
}

void dfs(List<List<Edge>> graph, int curr, visited) {
  print("$curr ");
  visited[curr] = true;
  for (int i = 0; i < graph[curr].length; i++) {
    int adjacent = graph[curr][i].dst;
    if (visited[adjacent] == false) {
      dfs(graph, adjacent, visited);
    }
  }
}

void main(List<String> args) {
  int vertex = 4;
  List<List<Edge>> graph = List.generate(vertex, (index) => []);
  List<bool> visited = List.filled(vertex, false);

  //creategraph
  

 createGraphNode(graph, 0, 1);
  createGraphNode(graph, 2, 3);
  createGraphNode(graph, 3, 3);

  //display
  display(graph);

  //bfs
  for(int i=0;i<visited.length;i++){
    if(visited[i]==false){
      dfs(graph, i,visited);
    }
  }
}
