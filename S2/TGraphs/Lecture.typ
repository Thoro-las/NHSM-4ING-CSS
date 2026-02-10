#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge, shapes

#import "@THR/Wide:1.0.0": *
#show: template.with(
  title: "Advanced Graph Theory",
  writer: "HADIOUCHE Azouaou",
  disclaimer: [This document contains the lectures given by Dr. MEHDAOUI.],
)
#set enum(numbering: "1.1.")

#let card = math.op("#")

#chapter("Fundamental Concepts")[]

#section[Types Of Graphs]
#def(name: "Undirected Graph")[
  An undirected graph $G$ is an ordered pair $G=(V, E)$ where $V$ is a finite set called the vertex set (vertices) and $E subset {{u, v} | u, v in V}$ called the set of edges.
]

#def(name: "Directed Graph")[
  A directed graph $G$ is an ordered pair $G=(V, A)$ where $V$ is the set of vertices and $A subset V times V$ called the set of arcs or directed edges.
]

// #grid(columns: (1fr, 1fr), align: center + horizon, [
//   #diagram({
//     node((0, 0), $a$, stroke: 0.5pt, name: "a")
//   })
// ])

#def(name: "Unweighted Graph")[
  An unweighted graph $G$ is a graph is a graph where all edges are considered equal.
]

#def(name: "Weighted Graph")[
  A weighted graph $G=(V, E)$ is a graph where there is a function $w: E -> RR$ where for each edge $e in E$, the weight of $e$ is $w(e)$.
]

#section("Concepts On Vertices & Edges")
#def(name: "Adjacent/Incident/Isolated")[
  Let $G = (V, E)$ a graph:
  + Two vertices $u, v in V$ are adjacent or neighbors if ${u, v} in E$.
  + A vertex $v$ is called incident to an edge $e$ if $v$ is an endpoint of $e$.
  + A vertex with no incident edges is called isolated.
  + The order of $G$ is $card V$.
  + The size of $G$ is $card E$.
  + The open neighborhood of $v in V$ is $cal(N)(v) = {u in V | {u, v} in E}$.
  + The closed neighborhood of $v in V$ is $[v] = cal(N)(v) union {v}$.
  + A degree of a vertex $v$ denoted $d(v)$ or $deg(v)$ is the number of edges incident to $v$, that is $deg(v) = card N(v)$.
  + If $G$ is directed then we define the following:
    + The out neighborhood of $v in V$ is $cal(N)^+ (v) = {u in V | (v, u) in A}$.
    + The in neighborhood of $v in V$ is $cal(N)^- (v) = {u in V | (u, v) in A)$.
    + The in/out degree are $deg^- (v) = card cal(N)^- (v), deg^+ (v) = card cal(N)^+ (v)$.
  + The number of edges incident to $v$ with maximum degree of $G$, $Delta (G) = max_(v in V) d(v)$ and minimum degree is $delta (G) = min_(v in V) d(v)$.
]

#lem(name: "Handshake")[
  For an undirected graph $G=(V, E)$ then $
    sum_(v in V) deg(v) = 2 card E
  $
]

#prf[
  Every edge ${u, v} in E$ contributes exactly $1$ to $deg(u)$ and $1$ to $deg(v)$ thus adding $2$ to $sum_(v in V) deg(v)$, so all edges counted twice in the sum of all edges.
]

#thm[
  The number of vertices with odd degree is even.
]

#prf[
  Let $V_o = {v in V | d(v) "odd"}$ and $V_e = {v in V | d(v) "even"}$, by the handshake lemma we have $
    2 card E = sum_(v in V) deg(v) &= sum_(v in V_o) deg(v) + sum_(v in V_e) deg(v)
  $ given that $2 card E$ is even and $sum_(v in V_e) deg(V)$ is even then necessarily $sum_(v in V_o) deg(v)$ is even, and since the sum of odd numbers is even if and only if the number of odd numbers is even then $card V_o$ is even so there is an even number of odd degree vertices.
]

#section[Simple & Multigraphs]
#def(name: "Simple/Multi Graph")[
  A graph $G$ is said to be simple if it has no loops and no multiple edges. A multigraph is a graph that may have loops and have multiple edges.
]

#thm[
  In any simple graph $G$ with order $n >= 2$, there exists at least two vertices with same degree.
]

#prf[
  The possible degrees in a simple graph is ${0, dots, n-1}$, however a graph cannot have a vertex with degree $0$ and $n-1$ at the same time, so either it has vertices of degree ${1, dots, n-1}$ or ${0, dots, n-2}$, and since there are $n$ vertices and $n-1$ choices for degrees, then by the pigeonhole principle, there are at least two vertices with the same degrees.
]

#pro[
  There are $binom(n, 2)$ maximum edges in a simple graph.
]

#def(name: "Walk/Trail")[
  Let $G=(V, E)$ be a graph
  + A walk of length $k$ is a sequence $v_1, e_2, v_2, dots, e_k, v_k$ with $e_i = {v_(i-1), v_i} in E$.
  + A trail is a walk with no repeated edges.
  + A path is a walk with no repeated vertices.
  + A walk is closed if $v_0 = v_k$.
]

#thm[
  If there is a walk from vertex $u$ to $v$ then there is also a path from $u$ to $v$.
]

#prf[You can do it, I suppose]

#def(name: "Circuit/Cycle")[
  + A circuit is a closed trail.
  + A cycle is a closed path.
  + A cycle of length $k$ is denoted $C_k$, unless otherwise specified.
  + The length of the cycle is the number of edges in it.
  + A graph $G$ is connected if for every pair of vertices $u, v in V$ there exists a path from $u$ to $v$, otherwise it is disconnected.
  + A subgraph $H$ of $G$ is a graph such that $V(H) subset V(G)$ and $E(H) subset E(G)$.
  + A connected component of $G$ is a maximum connected subgraph of $G$.
  + A spanning subgraph $H$ of $G$ is a subgraph such that $V(H) = V(G)$.
]

#thm[
  In a connected graph, any two longest paths share at least one vertex.
]
