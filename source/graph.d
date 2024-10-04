import std.algorithm: canFind;
class Graph
{
public:
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
		add_edge('C', 'F', 1);
		add_edge('E', 'F', 2);
	}
	void printGraph()
	{
		import std.stdio;
		for(int i = 0; i<num_of_vertices; i++)
			writeln(vertices[i], ": ", edges[i]);
	}
}
