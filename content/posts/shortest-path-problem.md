---
title: "Dijkstra's Algorithm: Solving the shortest path problem"
date: 2023-09-09T12:39:50+01:00
draft: false
ShowBreadCrumbs: true
tags: ['Programming']
cover:
  image: 'https://codeberg.org/Sheikyon/shortest-path-algorithm/media/branch/main/img/dijkstra-algorithm.png'
  # can also paste direct link from external site
  # ex. https://i.ibb.co/K0HVPBd/paper-mod-profilemode.png
  alt: 'A graph'
  caption: 'The shortest path problem'
  relative: false # To use relative path for cover image, used in hugo Page-bundles

showToc: true
---

Let's solve the shortest path problem

Today we're going to be solving the shortest path problem by implementing [Dijkstra's algorithm](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm) with some Python. So get a cup of coffee and a neovim buffer opened, it's going to be a ride.

## What is the shortest path problem?

Before we begin, we must first understand what is the shortest path problem. The shortest path problem is a fundamental optimization problem in computer science, speficifically graph theory under discrete mathematics or data structures and algorithms. It involves finding the shortest path or the minimum distance between two nodes (vertices) in a weighted graph. The "shortest path" is defined as the path with the smallest total sum of edge weights or distances. From this, we can tell that we would be working with a non-linear data structure throughout this article, The ["graph."](https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.simplilearn.com%2Ftutorials%2Fdata-structure-tutorial%2Fgraphs-in-data-structure&psig=AOvVaw1b4ReK_eZpIpF0QyT36lVf&ust=1694343143651000&source=images&cd=vfe&opi=89978449&ved=2ahUKEwi2sPSarp2BAxXDpycCHfeZAt4Qr4kDegQIARBx)

Don't get scared, I will try my best to simplify the concepts. The graph to many and I myself, is one of the hardest data structures to deal with. I'd say your interviewer may have an agenda against you, if he gives you a question on graph to solve.

### What is a graph?

| ![Graph](https://cdn-media-1.freecodecamp.org/images/vQ77VuGVlTR95GgMxzyKqydIqoRJcPcWrigy) |
| :----------------------------------------------------------------------------------------: |
|                          This is a simple illustration of a graph                          |

A graph is a data structure that represents relationships between objects. It consists of two main components: nodes (also called vertices) and edges. Nodes or Vertices are like data points or entities in the graph. Nodes can represent things like cities, people, web pages, or any object you want to model. Edges or Links represent the connections or relationships between nodes. Edges show how nodes are related to each other. For example, in a social network, edges might represent friendships between people.

### How are Graphs used?

Graphs are used in real-life applications to model relationships between several components. They are used from small-scale to large-scale distributed systems at large. Here are examples of platforms, systems or applications that graphs are used.

- Social Networks: Social media platforms use graphs to represent friendships and connections between users.
- Navigation Systems: GPS and map apps use graphs to find the shortest routes between locations.
- Web Page Ranking: Search engines like Google use graphs to determine the importance of web pages and their connections.
- Recommendation Systems: Websites like Netflix or Amazon use graphs to suggest products or movies based on your past interactions.
- Network Routing: Telecommunication networks use graphs to route data efficiently from one place to another.
- Airline Scheduling: Airlines use graphs to plan flight routes and schedules.
- Computer Networks: Graphs help in modeling and analyzing the structure of computer networks.

### Simple implementation of a graph.

The below is a Graph class that allows you to add vertices, add edges between vertices, and get neighbors of a vertex. It ensures that there are no duplicate vertices, making it unique.

```python
class Graph:
    def __init__(self):
        self.graph = {}

    def add_vertex(self, vertex):
        if vertex not in self.graph:
            self.graph[vertex] = []

    def add_edge(self, vertex1, vertex2):
        if vertex1 in self.graph:
            self.graph[vertex1].append(vertex2)
        else:
            self.graph[vertex1] = [vertex2]

    def get_neighbors(self, vertex):
        if vertex in self.graph:
            return self.graph[vertex]
        else:
            return []

    def __str__(self):
        return str(self.graph)


# A simple implementation
unique_graph = UniqueGraph()

unique_graph.add_vertex("A")
unique_graph.add_vertex("B")
unique_graph.add_vertex("C")

unique_graph.add_edge("A", "B")
unique_graph.add_edge("A", "C")
unique_graph.add_edge("B", "C")

print(unique_graph)
```

You can experiment with the above in any version of Python you wish, either version two or three.

## The shortest path problem, again.

Ever wondered how Google Maps is able to suggest the shortest direction for you to take to reach your office, workplace or school? Well underneath that robotic speech reading out addresses and directions, is some engineering marvel. Google Map does this by implementing the shortest path problem to find the quickest route between two locations. It uses various algorithms and data structures but prominently Dijkstra's algorithm and A\* (A-star) search algorithm, to calculate the shortest path and provide users with directions, estimated travel time, and alternative routes. Guess what? That's what we are using today.

## Dijsktra's Algorithm

Dijkstra's algorithm is a method for finding the shortest path between two points on a map or in a network. Imagine you want to drive from your house to a friend's house, but there are multiple possible routes. Dijkstra's algorithm helps you figure out the quickest way to get there.
Here's a simple flow:

- Start at your house.
- Consider all the nearby roads you can take to reach your friend's house. Look at the distance or time it takes to travel each road.
- Pick the shortest road and follow it.
- Keep doing this, always choosing the shortest road from your current location, until you arrive at your friend's house.
- Along the way, keep track of the total distance or time you've traveled. This will be the shortest path.
- You've made it using the shortest path.

Dijkstra's algorithm is like a step-by-step GPS for finding the shortest route in a network, whether it's for driving, walking, or any other type of travel.

### Implementing the aglorithm

Let's implement the algorithm to find the shortest path.

- First we are going to import the [heapq module, used to implement the heap algorithm](https://docs.python.org/3/library/heapq.html). Then create an adjacency list.

```python
import heapq
graph = {
    'A': {'B': 1, 'C': 4},
    'B': {'A': 1, 'C': 2, 'D': 5},
    'C': {'A': 4, 'B': 2, 'D': 1},
    'D': {'B': 5, 'C': 1}
}
```

- Next we create a function to find the shortest path.

```python
# Create a function to find the shortest path.
def dijkstra(graph, start):
    # Initialize distances to infinity for all nodes except the start node
    distances = {node: float('inf') for node in graph}
    distances[start] = 0

    # Priority queue to store the nodes with distances
    priority_queue = [(0, start)]

    while priority_queue:
        current_distance, current_node = heapq.heappop(priority_queue)

        # Skip if we've already found a shorter path.
        if current_distance > distances[current_node]:
            continue

        # Explore other neighbors (nodes)
        for neighbor, weight in graph[current_node].items():
            distance = current_distance + weight

            # If this path is shorter, then update the distance.
            if distance < distances[neighbor]:
                distances[neighbor] = distance
                heapq.heappush(priority_queue, (distance, neighbor))

    # Return distances
    return distances
```

- Let's implement use the function.

```python
# Find the shortest path from 'A' to all other nodes
start_node = 'A'
shortest_distances = dijkstra(graph, start_node)

# Print the shortest distances
for node, distance in shortest_distances.items():

    print(f'Shortest distance from {start_node} to {node} is {distance}')
```

As you can see, we have successfully implemented the graph to find the shortest path between a node "A" and other nodes accross the graph. It utilizes a [**priority queue**](<https://www.geeksforgeeks.org/heap-queue-or-heapq-in-python/#:~:text=Heap%20data%20structure%20is%20mainly,popped(min%2Dheap).>) (implemented as a min-heap) to efficiently explore nodes with shorter distances first.

Hope you enjoyed the tutorial
