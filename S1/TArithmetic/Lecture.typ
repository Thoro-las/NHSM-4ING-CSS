#import "@preview/zap:0.4.0"

#import "@THR/Wide:1.0.0": *
#show: template

#let xor = $times.circle$
#let nand = $bar$

#mainpage([Theory Of Computer Arithmetic], [HADIOUCHE Azouaou], [Oudjida])

#chap("Classical logic")[
  The most basic part of executing a computation on a machine is to describe the most basic information, which is true/false, and then compose them into a statement or a proposition.
]

informally, given a sentence, it is said to be a _statement_ if
- its declaritive, either affirmative or negative.
- its possible truth values are true or false.
- its verifiable in reality.

on those statements, we have some rules to give them truth values
- law of identity: $A=A$ is a true statement.
- law of non-contradiction: $not (A and not A)$ is false statement.
- law of excluded middle: either $not A$ or $A$ is true statement.

#sect("Transistors")
One of the biggest advancements in our modern world is the creation of a transistor, in principle the idea is simple, a transistor is simply an electrically affected button. It is represented as follows in electrical circuits

multiple basic operations can be made using these transistors, from a baasic memory to some logic gates and then bigger sequential circuits.

- AND OR NOT
- NOR XOR
- Data Latch

#nte[Some examples will be added soon.]

#colbreak()
#sect("Boolean Algebra")
Let $BB := {0, 1}$ denote the set of boolean values, which can be represented too with true/false. Any variable ta
#def(name: "Boolean Variable")[
  Let $x$ be a variable, $x$ is said to be a _boolean variable_ if it can assume values in $BB$. Let $f: BB^n -> BB$ a map, $f$ is called a _boolean function_.
]

#def(name: "Boolean Operations")[
  Let $x, y$ be two boolean variables, we define the operations $+, dot, bar.h$ to be the logical or, and, not respectively, which have the following truth tables.

  #align(center)[
    #table(
      columns: 5,
      [$y$], [$x$], table.vline(stroke: 0.7mm), [$overline(x)$], [$x+y$], [$x dot y$],
      [$0$], [$0$], [$1$], [$0$], [$0$],
      [$0$], [$1$], [$1$], [$1$], [$0$],
      [$1$], [$0$], [$1$], [$1$], [$0$],
      [$1$], [$1$], [$1$], [$1$], [$1$],
    )
  ]

  there are some other operations that are as follows
  - $x nand y = overline(x dot y)$.
  - $x xor y = x dot overline(y) + overline(x) dot y$.
  - $x => y = overline(x) + y$.
]

#pro(name: "Boolean Identites")[
  - $overline(overline(x)) = x$.
  - $x + x = x, x dot x = x$.
  - $x + 0 = x, x dot 1 = x$.
  - $x + 1 = 1, x dot 0 = 0$.
  - $x + y = y + x, x dot y = y dot x$.
  - $x+(y+z) = (x+y)+z, x dot (y dot z) = (x dot y) dot z$.
  - $overline(x + y) = overline(x) dot overline(y), overline(x dot y) = overline(x) + overline(y)$.
]

#def(name: "Duality")[
  Let $f: BB^n -> BB$ be a boolean function, we define the dual of $f$ as the map $(x_1, dots, x_n) |-> overline(f(overline(x)_1, dots, overline(x)_n))$. We can obtain the dual of a function $f$ by swapping $+$ with $dot$, $0$ with $1$ and keep the variables unchanged.
]

#def(name: "Conjunctive/Disjunctive Normal Form")[
  Let $f: BB^n -> BB$ be a boolean function, ${J_i}_(i=1)^n$ a set of subsets of $[|1, n|]$
  - CNF: $f(x_1, dots, x_n) = product_(i=1)^k sum_(j in J_i) y_j$.
  - DNF: $f(x_1, dots, x_n) = sum_(i=1)^k product_(j in J_i) y_j$.
  with $k in NN$, $y_i = x_i$ or $y_i = overline(x_i)$.
]

#pro[
  - ${+, bar.h}$, ${dot, bar.h}$, ${bar.v}$ are all a complete set of connectives, that is, any boolean function can be written using only one of those sets.
  - Any boolean function can be written in the CNF or DNF.
]
