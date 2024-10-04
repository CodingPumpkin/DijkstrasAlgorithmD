import std.stdio;
import std.algorithm;
import graph;

int minDistance(int[] dist, bool[] visited) {
    int min = int.max, index_of_min;
    for (int i = 0; i < 6; i++)
        if (!visited[i] && dist[i] <= min)
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

void my_dijkstraAlgorithm(Graph graph, char origin) 
{
	int origin_index = graph.index_of_vertex(origin);
	int[] distances = new int[graph.num_of_vertices];
	distances[] = int.max;
	distances[origin_index] = 0;
	for (int i = 0; i < graph.num_of_vertices; i++)
	{
		int min_distance = int.max;
		char closest_vertex = ' ';
		for (int j = 0; j < graph.num_of_vertices; j++)
		{
			if(!graph.visited[graph.vertices[j]] && graph.edges[i][j])
				if(graph.edges[i][j] < min_distance)
				{
					min_distance = graph.edges[i][j];
					closest_vertex = graph.vertices[j];
				}
		}
		if (min_distance == int.max)
			break;
		graph.visited[closest_vertex] = true;
		int c_index = graph.index_of_vertex(closest_vertex);
		for(int j = 0; j < graph.num_of_vertices; j++)
		{
			if(graph.edges[c_index][j])
				if (distances[c_index] + graph.edges[c_index][j] < distances[j])
					distances[j] = distances[c_index] + graph.edges[c_index][j];
		}
	}
	writeln(distances);
}

int main()
{
	auto my_graph = new Graph();
	my_graph.initDefaultGraph();
	my_graph.printGraph();
    my_dijkstraAlgorithm(my_graph, 'A');
 
    int[6][6] graph = [ [ 0, 1, 2, 0, 0, 0],
                        [ 1, 0, 1, 0, 3, 0],
                        [ 2, 1, 0, 2, 2, 0],
                        [ 0, 0, 2, 0, 1, 1],
                        [ 0, 3, 2, 1, 0, 2],
                        [ 0, 0, 0, 1, 2, 0],
    ];
    dijkstraAlgorithm(graph, 1);

    return 0;
}