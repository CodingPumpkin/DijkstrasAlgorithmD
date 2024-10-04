import std.algorithm: canFind;
class Graph
{
private:
	int num_of_vertices;
	char[] vertices;
	bool[char] visited;
	int[][] edges;
	void add_a_vertex(char new_vertex)
	{
		num_of_vertices += 1;
		vertices ~= new_vertex;
		visited[new_vertex] = false;
	}
	void add_edge(char v1, char v2, int d)
	{
		int num_v1 = index_of_vertex(v1);
		int num_v2 = index_of_vertex(v2);
		edges[num_v1][num_v2] = d;
		edges[num_v2][num_v1] = d;
	}
	int index_of_vertex(char vertex)
	{
		for (int i = 0; i < num_of_vertices; i++)
			if (vertices[i] == vertex)
				return i;
		return -1;
	}
	void initEdges()
	{
		for (int i = 0; i < num_of_vertices; i++)
			edges ~= new int[num_of_vertices];
	}
	void printDistances(int[] dists, char origin)
	{
		import std.stdio;
		for(int i = 0; i < num_of_vertices; i++)
			writeln("Shotest distance from ", origin, " to ", vertices[i], " is ", dists[i]);
	}
public:
	void initDefaultGraph()
	{
		add_a_vertex('A');
		add_a_vertex('B');
		add_a_vertex('C');
		add_a_vertex('D');
		add_a_vertex('E');
		add_a_vertex('F');
		initEdges();	
		add_edge('A', 'B', 1);
		add_edge('A', 'C', 2);
		add_edge('B', 'C', 1);
		add_edge('B', 'E', 3);
		add_edge('C', 'E', 2);
		add_edge('C', 'D', 2);
		add_edge('D', 'E', 1);
		add_edge('D', 'F', 1);
		add_edge('E', 'F', 2);
	}
	void printGraph()
	{
		import std.stdio;
		for(int i = 0; i<num_of_vertices; i++)
			writeln(vertices[i], ": ", edges[i]);
	}
	void shortest_distances_from_origin(char origin)
	{
		int origin_index = index_of_vertex(origin);
		int[] distances = new int[num_of_vertices];
		distances[] = int.max;
		distances[origin_index] = 0;
		for (int i = 0; i < num_of_vertices; i++)
		{
			int min_distance = int.max;
			char closest_vertex = ' ';
			for (int j = 0; j < num_of_vertices; j++)
			{
				if(!visited[vertices[j]] && edges[i][j])
					if(edges[i][j] < min_distance)
					{
						min_distance = edges[i][j];
						closest_vertex = vertices[j];
					}
			}
			if (min_distance == int.max)
				break;
			visited[closest_vertex] = true;
			int c_index = index_of_vertex(closest_vertex);
			for(int j = 0; j < num_of_vertices; j++)
			{
				if (distances[c_index] != int.max)
					if(edges[c_index][j] != 0)
						if (distances[c_index] + edges[c_index][j] < distances[j])
							distances[j] = distances[c_index] + edges[c_index][j];

			}
		}
		printDistances(distances, origin);
	}
}
