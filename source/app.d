import std.stdio;
import std.algorithm;
import graph;

int minDistance(int[] dist, bool[] visited) {
    int min = int.max, index_of_min;
    for (int i = 0; i < 6; i++)
        if (visited[i] == false && dist[i] <= min)
            min = dist[i], index_of_min = i;
    return index_of_min;
}

void dijkstraAlgorithm(int[6][6] graph, int start) {
    int[6] distances = int.max; // creating a list to store the shortest distances for each vertex
    bool[6] visited = false;
    distances[start] = 0; // the distance from source to source is zero
    for (int count = 0; count < 6 - 1; count++) {
    	int current_index = minDistance(distances, visited);
        visited[current_index] = true;
        for (int v = 0; v < 6; v++)
            if (!visited[v] &&
             	graph[current_index][v] &&
             	distances[current_index] != int.max && 
             	distances[current_index] + graph[current_index][v] < distances[v])
            {
                distances[v] = distances[current_index] + graph[current_index][v];
            }
    }
    writeln("Vertex number \t Distance from the Source\n");
    for (int i = 0; i < 6; i++){;
        writeln(i, "\t\t", distances[i]);
    }
}

void my_dijkstraAlgorithm(Graph graph, Vertex origin) {
    int size = cast(int) graph.vertices.length;
    int[char] distances;
    foreach (vertex; graph.vertices)
    	distances[vertex.name] = int.max; // creating a list to store the shortest distances for each vertex
    distances[origin.name] = 0; // the distance from source to source is zero
    char c = 'A';
    for (int i = 0; i < size; i++)// vertex_name, vertex; graph.vertices) {
    {
		writeln(c);
		Vertex current_vertex = graph.vertices[c];
    	//char closest_vertex = vertex.shortest_connection();
    	current_vertex.is_visited = true;
        foreach (connection_name, length; current_vertex.connections) //for every connection this vertex has
            if (!graph.vertices[connection_name].is_visited) //if it has not been visited yet
            	if (distances[c] + length < distances[connection_name]) //
            	{
            		distances[connection_name] = distances[c] + length; 
            	}
        c++;
	}
    writeln("Vertex \t Distance from the Source");
    foreach (name, _; graph.vertices){;
        writeln(name, "\t\t", distances[name]);
    }
}

int main()
{
	auto my_graph = new Graph();
	my_graph.initDefaultGraph();
	my_graph.printGraph();
    my_dijkstraAlgorithm(my_graph, my_graph.get_vertex('C'));
    int[6][6] graph = [ [ 0, 1, 2, 0, 0, 0],
                        [ 1, 0, 1, 0, 3, 0],
                        [ 2, 1, 0, 2, 2, 0],
                        [ 0, 0, 2, 0, 1, 1],
                        [ 0, 3, 2, 1, 0, 2],
                        [ 0, 0, 0, 1, 2, 0],
    ];

    dijkstraAlgorithm(graph, 2);

    return 0;
}