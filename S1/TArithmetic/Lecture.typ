#import "@preview/zap:0.4.0": *
#import "@preview/circuiteria:0.2.0" as circuiteria: *

#import "@THR/Wide:1.0.0": *
#show: template
#set table(stroke: 0.3mm)

#let xor = $times.circle$
#let nand = $bar$

#mainpage([Theory Of Computer Arithmetic], [HADIOUCHE Azouaou], [Oudjida], comment: [Some extra information will be added])

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

Now we will formalize calculations on boolean variables which is known as Boolean algebra, it will help us analyse and create circuits later on and also simplify them to have less components.

#sect("Boolean Algebra")
Let $BB := {0, 1}$ denote the set of boolean values, which can be represented too with true/false. Any variable ta
#def(name: "Boolean Variable")[
  Let $x$ be a variable, $x$ is said to be a _boolean variable_ if it can assume values in $BB$. Let $f: BB^n -> BB$ a map, $f$ is called a _boolean function_.
]

Boolean functions will be the main study of Boolean algebra, how they can be written, expressed and modified without altering its values, the following operations will be useful for operating on boolean variables and construct functions.

#def(name: "Boolean Operations")[
  Let $x, y$ be two boolean variables, we define the operations $+, dot, bar.h$ to be the logical or, and, not respectively, which have the following truth tables.

  #align(center)[
    #table(
      columns: 5,
      column-gutter: (auto, 0.9%, auto, auto, auto),
      [$y$], [$x$], [$overline(x)$], [$x+y$], [$x dot y$],
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
  #align(center)[
    #table(
      columns: 2,
      align: (left, left),
      table.cell(colspan: 2, [$overline(overline(x)) = x$]),
      [$x + x = x$], [$x dot x = x$],
      [$x + 0 = x$], [$x dot 1 = x$],
      [$x + 1 = 1$], [$x dot 0 = 0$],
      [$x + y = y + x$], [$x dot y = y dot x$],
      [$x+(y+z) = (x+y)+z$], [$x dot (y dot z) = (x dot y) dot z$],
      [$x(y+z) = x z + y z$], [$x + y z = (x+y) dot (x+z)$],
      [$overline(x + y) = overline(x) dot overline(y)$], [$overline(x dot y) = overline(x) + overline(y)$],
      [$x+overline(x) = 1$], [$x dot overline(x) = 0$],
    )
  ]
]

#def(name: "Duality")[
  Let $f: BB^n -> BB$ be a boolean function, we define the dual of $f$ as the map $(x_1, dots, x_n) |-> overline(f(overline(x)_1, dots, overline(x)_n))$. We can obtain the dual of a function $f$ by swapping $+$ with $dot$, $0$ with $1$ and keep the variables unchanged.
]

#def(name: "Literal/Minterm/Maxterm")[
  Let $x_1, dots, x_n$ be boolean variables and $y_1, dots, y_n$ such that $forall i in [|1, n|], y_i = x_i or y_i = overline(x_i)$.
  - A _literal_ is a proposition in the form of $x$ or $overline(x)$ with $x$ a boolean variable. 
  - A _minterm_ of $x_1, dots, x_n$ is the product $y_1 dot y_2 dots.c space y_n$.
  - A _maxterm_ of $x_1, dots, x_n$ is the sum $y_1 + y_2 dots + y_n$.
]

#def(name: "Conjunctive/Disjunctive Normal Form")[
  Let $f: BB^n -> BB$ be a boolean function, $x_1, dots, x_n$ boolean variables.
  - DNF: $f(x_1, dots, x_n) = sum_(i=1)^k X_i$ where $X_i$ are minterms.
  - CNF: $f(x_1, dots, x_n) = product_(i=1)^k X_i$ where $X_i$ are maxterms.
]

#pro[
  + the dual of a DNF is a CNF and vice versa.
  + Every boolean function can be written with only the defined connectives.
  + Every boolean function can be expressed only using one of those sets ${+, bar.h}$, ${dot, bar.h}$, ${bar.v}$, we call them a complete set of connectives.
  + Any boolean function can be written in the CNF or DNF.
]

#ooc[
  #prf[
    + A minterm is of the form $y_1 dots y_n$ then its dual is $y_1 + dots + y_n$ which is a maxterm, now if $f$ is in a DNF then it is the sum of minterms, the dual will become a product of maxterms which is a CNF, its easy to verify the rest.
    + Let $f: BB^n -> BB$ a boolean function, we define $g: BB^n -> BB$ as follows $(x_1, dots, x_n) & |-> sum_(i=1)^(2^n) sigma_i (x_1, dots, x_n) dot f(x_1, dots, x_n)$ where $sigma_i (x_1, dots, x_n)$ is defined as if we take the $i$ in base $2$, $i = overline(i_n i_(n-1) dots i_1 i_0)^(2)$ then $sigma_i (x_1, dots, x_n) = y_1 dots y_n$ and if $i_j = 1$ then $y_j = x_j$ otherwise $y_j = overline(x_j)$. Notice that $sigma_i (x_1, dots, x_n) = 1$ if and only if $overline(x_n dots x_1)^2 = i$. So we have for $(x_1, dots, x_n) in BB^n$, $g(x_1, dots, x_n) = f(x_1, dots, x_n)$ thus $f$ can written only with the connectives.

    + To prove this statement, we just need to use the fact that any function can be written using only $+, dot, bar.h$. 
     - We have by De Morgans laws that $x dot y = overline(overline(x) + overline(y))$ thus $+, bar.h$ is enough to express every function.
     - Same can be used to express $x + y = overline(overline(x) dot overline(y))$.
     - Now we can use the NAND to write everything, notice that $x|x = overline(x)$ and $(x|y)|(x|y) = x dot y$ thus we use the previous statement and we get that ${|}$ is a complete set of connectives.

    + Notice that in the first statement we proved that any boolean funtion can be written in the DNF, using the same function $sigma_i$ we can construct a DNF, it will be of the form $g: (x_1, dots, x_n) |-> product_(i=1)^(2^n) overline(f(x_1, dots, x_n)) dot overline(sigma_i (x_1, dots, x_n))$.
  ]
]

#sect("Transistors")
One of the biggest advancements in our modern world is the creation of a transistor, in principle the idea is simple, a transistor is simply an electrically controlled valve. 

#nte[The examples and all will be added soon]

#sect("Logic Gates & Digital Circuits") To be able to use and/or/not in circuits, we introduce the most basic circuit components called logic gates, as the table below shows

#align(center)[
  #table(
    columns: 3,
    [Not], [And], [Or],
    [
      #circuiteria.circuit({
        import circuiteria: *

        gates.gate-not(id: "not", x: 0, y: 0, w: 1, h: 1)
        wire.stub("not-port-out", "east", name: $S$, length: 0.5)
        wire.stub("not-port-in0", "west", name: $A$, length: 0.5)
      })
    ],
    [
      #circuiteria.circuit({
        import circuiteria: *

        gates.gate-and(id: "and", x: 0, y: 0, w: 1, h: 1)
        wire.stub("and-port-out", "east", name: $S$, length: 0.5)
        wire.stub("and-port-in0", "west", name: $A$, length: 0.5)
        wire.stub("and-port-in1", "west", name: $B$, length: 0.5)
      })
    ],
    [
      #circuiteria.circuit({
        import circuiteria: *

        gates.gate-or(id: "or", x: 0, y: 0, w: 1, h: 1)
        wire.stub("or-port-out", "east", name: $S$, length: 0.5)
        wire.stub("or-port-in0", "west", name: $A$, length: 0.5)
        wire.stub("or-port-in1", "west", name: $B$, length: 0.5)
      })
    ],
    [
      #table(columns: (1fr, 1fr),
        $A$, $S$,
        $0$, $1$,
        $1$, $0$,
      )
    ],
    [
      #table(columns: (1fr, 1fr, 1fr),
        $A$, $B$, $S$,
        $0$, $0$, $0$,
        $0$, $1$, $1$,
        $1$, $0$, $1$,
        $1$, $1$, $1$
      )
    ],
    [
      #table(columns: (1fr, 1fr,1fr),
        $A$, $B$, $C$,
        $0$, $0$, $0$,
        $0$, $1$, $0$,
        $1$, $0$, $0$,
        $1$, $1$, $1$
      )
    ]
  )
]

Thus we can use these to represent some circuits that behave as logical circuits called digital circuits.

#exm[
  - A commitee of $n$ individuals decide issues for an organization. Each individual votes either yes or no for each proposal that arises. The proposal is passed if it receives at least $p$ votes. Its easy to notice that the solution is equal to $ y = sum_(1 <= i_1 < dots.c < i_p <= n) x_(i_1) x_(i_2) dots x_(i_p) $ where $x_1, dots, x_n$ represent the votes of the individuals and $y$ the proposal passing. In case, $n=3$ and $p=2$ we get #align(center)[
    #circuiteria.circuit({
      import circuiteria: *

      gates.gate-and(id: "and1", x: 0, y: 0, w: 1, h: 1)
      gates.gate-and(id: "and2", x: 0, y: 2, w: 1, h: 1)
      gates.gate-and(id: "and3", x: 0, y: 4, w: 1, h: 1)

      gates.gate-or(id: "or", inputs: 3, x: 3, y: 1.75, w: 1, h: 1.5)

      wire.wire("w1", ("and3-port-out", "or-port-in0"), style: "zigzag")
      wire.wire("w2", ("and2-port-out", "or-port-in1"), style: "zigzag")
      wire.wire("w3", ("and1-port-out", "or-port-in2"), style: "zigzag")

      wire.wire("w4", ((-3, 1), "and1-port-in0"), style: "zigzag", zigzag-ratio: 30%)
      wire.wire("w5", ((-3, 1), "and2-port-in1"), style: "zigzag", zigzag-ratio: 30%)
      wire.intersection("w5.zig")

      wire.wire("w6", ((-3, 4), "and2-port-in0"), style: "zigzag", zigzag-ratio: 40%)
      wire.wire("w7", ((-3, 4), "and3-port-in1"), style: "zigzag", zigzag-ratio: 40%)
      wire.intersection("w6.zig")

      wire.wire("w8", ((-3, 2.5), "and1-port-in1"), style: "zigzag", zigzag-ratio: 20%)
      wire.wire("w9", ((-3, 2.5), "and3-port-in0"), style: "zigzag", zigzag-ratio: 20%)
      wire.intersection("w8.zig")
    })
  ]
]

#subs("Circuit Simplification & Reduction Methods")
+ *Kernaugh Maps*
+ *Quine-McCluskey Method*
