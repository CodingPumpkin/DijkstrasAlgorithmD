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
		auto ver = new Vertex();
		ver.name = v.name;
		foreach (key, value; v.connections)
		{
			ver.connections[key] = value;
		}
		vertices ~= ver; 
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
	void initDefaultGraph()
	{
		auto v = new Vertex();
		v.name = "A";
		v.connections["A"] = 0;
		v.connections["B"] = 1;
		v.connections["C"] = 2;
		add_a_vertex(v);
		v.name = "B";
		v.connections["A"] = 1;
		v.connections["B"] = 0;
		v.connections["C"] = 1;
		v.connections["E"] = 3;
		add_a_vertex(v);
		v.name = "C";
		v.connections["A"] = 2;
		v.connections["B"] = 1;
		v.connections["C"] = 0;
		v.connections["E"] = 2;
		v.connections["D"] = 2;
		add_a_vertex(v);
		v.name = "D";
		v.connections["D"] = 0;
		v.connections["C"] = 2;
		v.connections["E"] = 1;
		v.connections["F"] = 1;
		add_a_vertex(v);
		v.name = "E";
		v.connections["B"] = 3;
		v.connections["C"] = 2;
		v.connections["D"] = 1;
		v.connections["E"] = 0;
		v.connections["F"] = 2;
		add_a_vertex(v);
		v.name = "F";
		v.connections["D"] = 1;;
		v.connections["E"] = 2;
		v.connections["F"] = 0;
		add_a_vertex(v);
	}
	void printGraph()
	{
		import std.stdio;
		writeln(size);
		foreach (v; vertices)
		{
			writeln(v.name, " is connected to: ");
			foreach (key, value; v.connections)
			{
				write(key, "(", value, ")\t");
			}
			writeln();
		}
	}
}

class Vertex
{
	int[string] connections;
	string name;
	bool is_visited = false;
public:
	void set_name(string n)
	{
		name = n;
	}
}

