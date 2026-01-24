#import "@preview/zap:0.4.0": *
#import "@preview/circuiteria:0.2.0" as circuiteria: *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#import "@THR/Wide:1.0.0": *
#show: template.with(
  title: "Computer Arithmetic",
  disclaimer: [This document follows the slides and lessons given by Mr.OUDJIDA, written in a mathematical textbook format, freedoms are taken when writing the course.],
  writer: "HADIOUCHE Azouaou",
  warning: "USE IT AT YOUR OWN RISK!",
)

#let xor = $times.circle$
#let nand = $bar$
#let card = math.op("#")

#chapter("Classical logic")[
  The most basic part of executing a computation on a machine is to describe the most basic information, which is true/false, and then compose them into a statement or a proposition.
]

Informally, given a sentence, it is said to be a _statement_ if
- it is declarative, either affirmative or negative.
- it is possible truth values are true or false.
- it is verifiable in reality.

On those statements, we have some rules to give them truth values
- Law of identity: $A=A$ is a true statement.
- Law of non-contradiction: $not (A and not A)$ is false statement.
- Law of excluded middle: either $not A$ or $A$ is true statement.

Now we will formalize calculations on boolean variables which is known as Boolean algebra, it will help us analyze and create circuits later on, also simplifying them to have less components.

#section("Boolean Algebra")
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

#section("Logic Gates & Digital Circuits") To be able to use and/or/not in circuits, we introduce the most basic circuit components called logic gates, as the table below shows

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
  - A commitee of $n$ individuals decide issues for an organization. Each individual votes either yes or no for each proposal that arises. The proposal is passed if it receives at least $p$ votes. Its easy to notice that the solution is equal to $ y = sum_(1 <= i_1 < dots.c < i_p <= n) x_(i_1) x_(i_2) dots x_(i_p) $ where $x_1, dots, x_n$ represent the votes of the individuals and $y$ the proposal passing. In case, $n=3$ and $p=2$ we get 

  #align(center)[
    #image("Images/VoteCircuit.svg")
  ]
]

#section("Transistors")
One of the biggest advancements in our modern world is the creation of a transistor, in principle the idea is simple, a transistor is simply an electrically controlled switch. We use this to materialize the logic gates to be able to use them directly.

#subsection("Circuit Simplification & Reduction Methods")
+ *Kernaugh Maps*
+ *Quine-McCluskey Method*

#chapter("Arithmetics")[
  Computer arithmetic is the process of using algorithms for doing basic operations on numbers like addition multiplication... etc. To be able to do those operations, a representation of the numbers is needed, which will be the first part of the course.
]

#section("Positive Integer Representations")
Multiple numeral systems were devlopped throughout history, the roman numerals were the oldest that are still in use, but not in any complicated systems due to the difficulty of doing arithmetic operations on them.

#align(center)[
  #diagram(
    spacing: (2mm, 5mm),
    node-stroke: luma(80%),
    node((2.5, 0), [*Representation Systems*], name: <a>),

    node((0.6, 0.5), [*Positional Systems*], name: <b>),
    node((0.6, 1), [*Weighted Systems*], name: <c>),

    node((0, 1.8), [
      *Mixed Radix*
      #align(left)[
        - Factorial.
        - Time.
      ]
    ], name: <d>),

    node((1.3, 1.8), [
      *Fixed Radix*
      #align(left)[
        - Decimal.
        - Duodecimal.
        - Radix-$2^r$.
      ]
    ], shape: "rect", name: <e>),

    node((3.5, 1), [
      *Non-Positional Systems*
      #align(left)[
        - Roman numerals.
        - Residue number system.
        - Double base number system.
        - Multi base number system.
        - Addition chain.
      ]
    ], name: <f>),

    edge(<a>, <f>, "-|>"),
    edge(<a>, <b>, "-|>"),
    edge(<b>, <c>, "-|>"),
    edge(<c>, <d>, "-|>"),
    edge(<c>, <e>, "-|>"),
  )
]

#subsection("Weighted Representation System")
Let $I = [|0, n-1|]$, and ${D_i}_(i in I)$ be sets of digits, the digit vector $x=(x_(n-1), dots, x_0) in D_(n-1) times dots.c times D_0$ and let $w$ a weight vector $w = (w_n, dots, w_0) in ZZ^n$, we have that the integer mapping of $x$ in this weighted system is $w^t x = sum_(i=0)^(n-1) x_i w_i$. The number of combinations possible is $product_(i=0)^(n-1) card D_i$ but notice that there representations are not necessarily unique.

#subsection("Mixed Radix Representation System")
The mixed radix representation is the same as weighted but has a different way to get the weight vector, we consider a radix vector $r = (r_(n-1), dots, r_0)$, $w_0 = 1$ and $w_(i) = w_(i-1) dot r_(i-1)$ and by using the representation from the weighted system we get $w^t x = sum_(i=0)^(n-1) x_i product_(j=0)^(i-1) r_i$. 

- The factorial system is an example of such a system, where we take the radix vector to be $r=(n, n-1, dots, 2, 1)$ then we get that the weight vector would be $w = (n!, (n-1)!, dots, 2!, 1!)$ and we take $D_i = {0, 1, dots, i}$, thus we get a unique representation for each integer, and using this represetation and the previous formula we get that the number of permutations is $product_(i=0)^(n-1) card D_i = sum_(i=0)^(n-1) i dot (i-1)! = (n+1)! - 1$.


#subsection("Fixed Radix Representation System")
The fixed radix represetation is just taking the mixed radix represetation with the vector to be all the same constant $r$ and $D_i = D$ and thus we get that the representation is $product_(i=0)^(n-1) x_i r^i$. 

- For $r=10, D={0, dots, 9}$, it is the decimal system.
- For $r=2, D={0, 1}$, it is the binary system. 

We get a redundant representation since we can represent a number with multiple representations. Let $r, s$ be the indices of two unbalanced positional number systems, $n_r$ and $n_s$ represent the number of digits required in radices $r$ and $s$, then we get that $n_r\/n_s = log(s)\/log(r)$.

#section("Integer Representations In Binary")
We went through the way we represent positive integers in multiple systems. Now we will consider the binary system and the goal is to represent negative integers too, for that we will see 3 typical ways to represent them. Consider $w$ the number of bits we will use for the representations and $x=(x_(w-1), dots, x_0) in BB^w$.

#colbreak()
#def(name: "Sign & Magnitude")[
  - Value: $X = (-1)^(x_(w-1)) dot.c sum_(i=0)^(w-2) x_i 2^i$
    - $x_(w-1)$ is called the _sign bit_
    - $(x_(w-2), dots, x_0)$ is the magnitude.
  - Range: $[|-2^(w-1) + 1; 2^(w-1) + 1|]$.

  #align(center)[
    #table(
      columns: 2,
      align: left + top,
      table.header([Advantages], [Disadvantages]),
      [
        - Simple conceptually.
        - Easy to negate the values by flipping the sign bit.
        - Range is balanced evenly around 0 like the unsigned integers with one less bit.
      ], [
        - Duplicate value for zero.
        - Arithmetic operations are done with different circuits.
        - Overflow detection is more complicated because of the duplicate zero and sign bit.
      ]
    )
  ]
]

#def(name: "One's Complement")[
  - Value: $X = -x_(w-1) dot.c (2^(w-1) - 1) + sum_(i=0)^(w-2) x_i 2^i$.
  - Range: $[|-2^(w-1) + 1; 2^(w-1) + 1|]$.

  #align(center)[
    #table(
      columns: 2,
      align: left + top,
      table.header([Advantages], [Disadvantages]),
      [
        - Better for arithmetic with similar circuits to unsigned integers.
        - Easy to negate the values by inverting all the bits.
      ], [
        - Duplicate value for zero.
        - The range of the representation is asymmetric.
      ]
    )
  ]
]

#def(name: "Two's Complement")[
  - Value: $X = -x_(w-1) dot.c 2^(w-1) + sum_(i=0)^(w-2) x_i 2^i$.
  - Range: $[|-2^(w-1); 2^(w-1) - 1|]$.

  #align(center)[
    #table(
      columns: 2,
      align: left + top,
      table.header([Advantages], [Disadvantages]),
      [
        - Single zero representation.
        - Arithmetic circuits use the exact same as unsigned integers.
      ], [
        - The range is asymmetric.
        - The negation requires extra circuitry.
      ]
    )
  ]
]

An overflow may happen in all representations, we will give the rules for detecting overflow in addition. Notice that if we add two numbers of different signs then there is no possible overflow. Thus, we will verify it only for numbers with the same sign.


#pro(count: false, name: "Properties Of Two's Complement")[\
  Let $A = a_n a_(n-1) dots a_0$ and $B = b_n b_(n-1) dots b_0$ two numbers represented in the two's complement representation.
  + $A+B = c_n c_(n-1) dots c_0$ overflows if and only if $a_n = b_n$ and $c_n != a_n$.
  + $A$ can be represented in $n+d$ bits in two's complement with the representation $A = underbrace(a_n dots a_n, d) a_n dots a_0$.
]

#prf[
  +
  // #ooc[
  //   + We consider the value of $A+B$
  //
  //   $
  //     A+B &= -a_(n) dot.c 2^(n) sum_(i=0)^(n-1) a_i - b_(n) dot.c 2^(n) sum_(i=0)^(n-1) b_i dot.c 2^i \
  //     &= - (a_(n) + b_(n)) dot.c 2^(n) + sum_(i=0)^(n-1) (a_i + b_i) 2^i
  //   $
  //
  //   Suppose that $A+B$ overflows, in 
  // ]
  + Consider the value of $A' = a_(n+d) a_(n+d-1) dots a_(n+1) a_n dots a_0$, $forall i in [|1, d|], a_(n+i) = a_n$
  $
    A' &= - a_(n+d) dot.c 2^(n+d) + sum_(i=0)^(n+d-1) a_i dot.c 2^i\
    &= - a_(n) dot.c 2^(n+d) + a_n sum_(i=0)^(d-1) 2^(n+i) + sum_(i=0)^(n-1) a_i dot.c 2^i = - a_n dot.c sum_(i=0)^(d) 2^(n+i) + sum_(i=0)^(n-1) a_i dot.c 2^i\
    &= -a_n 2^n dot.c (1-2^(d+1))/(1-2) + sum_(i=0)^(n-1) a_i dot.c 2^i = -a_n 2^n dot.c (2^(d+1) - 1) + sum_(i=0)^(n-1) a_i dot.c 2^i
  $
  by truncating the first $n$ elements we get $- a_n 2^n dot.c (2 - 1) + sum_(i=0)^(n-1) a_i dot.c 2^i = A$.
]

#colbreak()
#section("Decimal Representations In Binary")
After representing integers with binary, we will represent numbers with decimal digits. So we consider the following representations, we take 

#def(name: "Fixed Point Representation")[\
  Let $x = x_(n-1) x_(n-2) dots x_(0) x_(-1) dots x_(-m) in BB^(n + m)$ with $n, m in NN$.
  - Value: $X = -x_(n-1) dot.c 2^(n - 1) + sum_(i=-m)^(n-2) x_i dot.c 2^i$
  - Range: $[|-2^(n-1); 2^(n-1) - 1|]\/2^m$.

  We denote the values represented in this fixed point system as $Q_(n.m)$ where $n$ is the number of bits for integers and $m$ for the decimal part.
  #align(center)[
    #table(
      columns: (1fr, 1fr),
      align: left + top,
      table.header([Advantages], [Disadvantages]),
      [
        - Simple to implement.
        - Deterministic precision.
        - Equally distributed range.
      ], [
        - Approximation errors for fractional parts and limited precision.
        - Overflows occur easily.
      ]
    )
  ]
]

#def(name: "Floating Point Representation")[\
  Let $x = x_(w-1) x_(w-2) dots x_(0) in BB^(1 + e + m)$ with $m, e in NN$.
  - Value: $X = (-1)^(x_(w-1)) dot.c M dot.c 2^E$ with
    - $E = x_(m+e) dots x_(m) - E_"bias"$ and $E_"bias" = 2^(e-1) - 1$.
    - $M = x_(m-1) dots x_0$.
  - Range: $[-2^(2^(E-1)); 2^(2^(E-1))]$ (not the exact set, many gaps are in this range).

  The first bit is called the sign bit, the $e$ bits after it are called the exponent bits and the $m$ are called the mantissa.

  #align(center)[
    #table(
      columns: (1fr, 1fr),
      align: left + top,
      table.header([Advantages], [Disadvantages]),
      [
        - Large dynamic range.
        - Support for special numbers.
        - Standardized (IEEE-754).
      ], [
        - Non-uniform distribution of presentable values.
        - Complex for implementation.
      ]
    )
  ]

  Floating point representation extra special numbers depending on the exponent.
  #align(center)[
    #table(
      columns: (auto, auto, auto, 1fr),
      align: (center, center, center, left),
      table.header([sign], [exponent], [mantissa], [represent]),
      [any], [$00 dots 0$], [$00 dots 0$], [both $0$ and $-0$],
      [$+$], [$11 dots 1$], [$00 dots 0$], [$+ infinity$],
      [$-$], [$11 dots 1$], [$00 dots 0$], [$- infinity$],
      [any], [$11 dots 1$], [non-zero value], [NaN (Not a Number)]
    )
  ]
]

#chapter("Coding Theory")[]
#v(-0.7cm)
#text(fill: red, [
  Hello, so this is a warning more than anything, if you arrived here and you are still with Oudjida, he will become like the so-called-now mythical Berrachedi. Consider this warning seriously, you will maybe lose it from now on if you care, or you will just not care. Try to not care, best advice...
])

#section[Radix-2#super[r] Encoding]
We start by considering a number $K = k_(l-1) dots k_0 in BB^l$, we take $k_j = 0$ if $j in.not [|0, l-1|]$ and $w in NN$ a window size, we can write $K$ in the following way $
  K &= sum_(i=0)^(ceil((l+1)/w) - 1) Q_i dot.c 2^(w dot i)
$ with $Q_i = -2^(w-1) k_(w dot i + w - 1) + sum_(j=0)^(w-2) 2^j dot.c k_(w dot i + j) + k_(w dot i - 1)$. We can decompose $Q_i$ into the following form $Q_i = (-1)^(s_i) dot.c 2^(n_i) dot.c m_i$, $s_i = k_(w dot i + w - 1)$ and using the following procedure we get $m_i$ and $n_i$.
  #code([
  ```pcode
  input: Q.
  output: m, n such that Q = m*2^n.

  m = Q
  n = 0
  while m % 2 = 0 do
    n = n + 1
    m = m / 2
  end
  
  return m, n
  ```])
By using this decomposition, we get this writing $
  K = sum_(i=0)^(ceil((l+1)/w) - 1) (-1)^(s_i) dot.c m_i dot.c 2^(w dot i + n_i)
$
and thus we can represent it in the Radix-$2^w$ as follows $
  K = (underbracket(00 dots r_n underbracket(0 dots 0, n_n), w "digits") dots.c underbracket(00 dots r_2 underbracket(0 dots 0, n_2), w "digits") underbracket(00 dots r_1 underbracket(0 dots 0, n_1), w "digits"))_(2^w)
$ with $ n = display(ceil((l+1)/2)) - 1 #h(1cm) r_i = display(cases(m_i "if" s_i = 0, overline(|m_i|) "if" s_i = 1)) $

We take the following example $K = overline(10110011110101101101101)^2$, we have that $l = 23$ and $w=4$, we decompose it into $Q_i$ as follows $
  text(fill: #red, 00) 10110011110101101101101 text(fill: #red, 0)\
  arrow.b\
  S_5 = 00101, S_4 = 10011, S_3 = 11101, S_2 = 10110, S_1 = 01101, S_0 = 11010
$ to calculate the $Q_i$, for example $Q_0$, we take the last digit of $S_0$ and add it to the first $4$ digits, so $Q_0 = 1101 + 0 = 1101$ which is $-3$ in two's complement, by doing thing for each one of them we get $
  Q_5 = 3, Q_4 = -6, Q_3 = -1, Q_2 = -5, Q_1 = 7, Q_0 = -3
$ by decomposing into $m_i$ and $n_i$ we get $
  mat(s_5 = 0; m_5 = 3; n_5 = 0),
  mat(s_4 = 1; m_4 = 3; n_4 = 1),
  mat(s_3 = 1; m_3 = 1; n_3 = 0),
  mat(s_2 = 1; m_2 = 5; n_2 = 0),
  mat(s_1 = 0; m_1 = 7; n_1 = 0),
  mat(s_0 = 1; m_0 = 3; n_0 = 0)
$ and then we get the encoding as $
  K = (0003 00overline(3)0 000overline(1) 000overline(5) 0007 000overline(3))_(2^4)
$

#section[SSP Encoding]
The process is significantly easier than Radix-$2^r$. We start by considering a number $K = k_(l-1) dots k_0 in BB^l$ and $w in NN$ a window size. We start with smallest $i$ such that $k_i != 0$, we consider the block $k_(i+w-1) dots k_i$, we take its value in the in two's complement representation as $d$ and replace the block $k_(i+w-1) dots k_i$ with $00 dots 0 d$, if the sign of $d$ is negative then add $1$ to the number $k_(l-1) dots k(i+w)$.

For (I suppose, I hope, I honestly don't know) making the algorithm quicker, we define a look-up table, that takes a number and returns its two's complement representation, we define it as ```pcode LUT(K[w-1,...,0])``` and returns $d = - k_(w-1) 2^(w-1) + sum_(i=0)^(w-2) k_i 2^i$. I would like to take in the algorithms the notation ```pcode K[i]``` to mean $k_i$ and ```pcode K[j,...,i]``` to mean $k_j k_(j-1) dots k_(i+1) k_i$.
#code([
```pcode
input:
  - K: number
  - l: length of K
  - w: window
output: SSP representation of K with window w

i = 0
while i < l do
  while do K[i] == 0 and i < l do
    i++
  end

  s = K[i+w-1]
  d = LUT(K[i+w-1,...,i])
  K[i+w-1,...,i] = [0,0,...,0,d]
  i = i + r

  if s == 1 then
    j = i
    while K[j] == 1 do
      K[j] = 0
      j = j + 1
    end
    K[j] = 1
  end
end
return K
```])
