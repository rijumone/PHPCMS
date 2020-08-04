---
Title: Data Structures, Volume 1
Description: Directed Acyclic Graphs
Date: 04 August 2020
Image: /assets/img/dag.png
Template: single
---

# Directed Acyclic Graphs

Wait, what?

Why start with Graphs at all, and even then a subset of them? Because, quoting Tony Stark, "sometimes you gotta run before you can walk."

# Intro

As mentioned, Directed Acyclic Graphs (or DAGs) are a subset of the graph data structure. 

They differ from conventional graphs:
- DIRECTED:
The edges have a direction associated with them.
- ACYCLIC:
It has no directed cycles. Simply put, the same node may not be visited again.

# Use

DAGs are used extensively for workflows, particularly those involving data. Indeed the reason I had a use for them was for our upcoming ETL platform.

It must be mentioned here that I was first introduced to the concept of DAGs while I was implementing [Apache Airflow](https://airflow.apache.org/).

# Implement

We will be using the [`networkx`](https://networkx.github.io/) library.

```bash
$ pip install networkx
```

Since, its a ETL pipeline, let's start simple. Two input `table`s joined with a `join` and pushing data to another output `table`.

Let's start with the root node and then keep adding other nodes.

```python
>>> import networkx as nx

>>> graph = nx.DiGraph()

>>> graph.add_edges_from([
... ("table_1", "join"),
... ("table_2", "join"),
... ])

```

Note: [DiGraph](https://networkx.github.io/documentation/stable/reference/classes/digraph.html) is Directed Graph.

# Visualization

It is a major assistance to be able to visualize the graphs that we create so that we know we are on the right track.

Visualization can be done with `matplotlib`.

```bash
$ pip install matplotlib
```

```python
>>> import networkx as nx
>>> from matplotlib import pyplot

>>> graph = nx.DiGraph()

>>> graph.add_edges_from([
... ("input_table_1", "join"),
... ("input_table_2", "join"),
... ])

>>> pyplot.clf()
>>> pyplot.tight_layout()
>>> nx.draw_networkx(graph, arrows=True)
>>> pyplot.savefig("graph.png", format="PNG")
>>> pyplot.clf()
```
A PNG file will be created in the working directory.

[<img src="/assets/img/graph.png" class="img-fluid"/>](/assets/img/graph.png)

# More Nodes

About that `output` table.

```python
>>> graph.add_edges_from([
... ("input_table_1", "join"),
... ("input_table_2", "join"),
... ("join", "output_table_1"),
... ])
```

[<img src="/assets/img/o_graph.png" class="img-fluid"/>](/assets/img/o_graph.png)

# Validation

As the number of nodes and edges keep on increasing, it will be difficult to keep track of the graph graphically (pun unintentional). For times as these, one can:

- check that the graph is indeed directed.
```python
>>> nx.is_directed(graph) 
True
```
- check that the graph is directed AND acyclic.
```python
>>> nx.is_directed_acyclic_graph(graph)
True
```

There are a ton of other functions on this library. Join me next time when I discuss [topological ordering](https://en.wikipedia.org/wiki/Topological_sorting) and why it is needed.