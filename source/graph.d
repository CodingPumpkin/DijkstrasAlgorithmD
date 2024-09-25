class Graph
{
private:
	int size;
	Vertex[] vertices;

public:
	this() 
	{
		size = 0;
	}
	void add_a_vertex(Vertex v)
	{
		vertices ~= v; 
		size += 1;
	}
	int get_size()
	{
		return size;
	}
	Vertex get_vertex(int i)
	{
		assert(i < size);
		return vertices[i];
	}
}

class Vertex
{
	int weight;
	string name;
	bool visited = false;
}
