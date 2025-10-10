#import "@THR/Wide:1.0.0": *
#show: template
#set math.cases(gap: 3mm)

#let sign = math.op("sgn")
#let card = math.op("#")
#let repr(e) = $overline(#e)$

#let sp = $triangle.stroked.small.r$
#let bl = $square.stroked.small$

#mainpage("Complexity Theory", "HADIOUCHE Azouaou", "Berrachedi", comment: [The course will be heavily changed due to the fact that the needs the computational theory])


#chap("Introduction")[
  Complexity theory revolves around the idea of measuring execution time of an algorithm giving a measure of the execution time given some taken parameters about the inputs.
]

To introduce the concept of computation complexity, we start by considering the calculation of a determinant of a square matrix, we can calculate it with two different ways, first by the definition of a determinant, the second with LU decomposition.

- We start by determining how many steps needed for calculating the determinant of an $n times n$ matrix by definition. Let $C_1(n)$ be the number of steps for evaluating the determinant of an $n times n$ matrix $A=(A_i^j)$. By definition we have that $
  det A = sum_(sigma in S_n) sign sigma product_(i=1)^n A_i^(sigma(i)).
$ We have $card S_n = n!$, if we suppose that $sign sigma, sigma(i)$ can be calculated in a constant time, then the remaining product has $n$ steps to evaluate thus we have that $C_1(n)=n dot n!$

#ooc[
- Now for the calculation of determinant using the LU method, denote $C_2(n)$ the number of steps needed for this calculation, if we denote $T(n)$ be the amount of steps needed to do the LU decomposition, its easy to calculate that $T(n) = ((n-2)(n-1)(2n-3))\/3$ and then we get that $A = L U$, with $L, U$ triangular, and $det L = 1$, then $det(A) = det(L U) = det L dot det U = det U = product_(i=1)^n u_(i i)$ thus $C_2(n) = T(n) + n$.

Now that we calculated the amount of steps needed for each one, we will assume that each step takes a second and that we want to calculate the determinant of $100 times 100$ matrix. Using the first algorithm, we get that it will take $C_1(100) = 100 dot 100!$ seconds which is approximately $3 dot 10^150$ years, for comparision, we have that the life span of the universe is approximately $10^10$ years, if we use the second method, it will take $C_2(100)=T(100)+100$ which takes approximately a week and a day to calculate.

For our interest, we usually do not check exactly how the algorithm behaves at each point, but how it behaves asymptotically, thus we created our comparision notations.
  #def(name: "Comparision Notations")[
    Let $f, g: NN -> RR^+$, we define the following notations:
      - $f=o(g)$ $<=>$ $forall epsilon > 0, exists N in NN, forall n >= N, f(n) <= epsilon dot g(n)$.
      - $f=O(g)$ $<=>$ $exists c > 0, exists N in NN, forall n >= N, f(n) <= c dot g(n)$.
      - $f=Theta(g)$ $<=>$ $f = O(g)$ and $g = O(f)$.
  ]
]

#exm[
  - if we consider our previous problem then $C_1(n) = O(n!)$ and $C_2(n)=O(n^3)$ which makes it really easy for us to compare the asymptotic behavior.
  - if $f(n)=100n, g(n)=n^2$ then $f = O(g)$ and $f = o(g)$.
  - if $f(n)=n^2, g(n)=100n^2 + 2n + 1$ then $f = Theta(g)$.
]

#pro[
  Let $f, g: NN -> RR^+$, suppose that, then
  - if $exists N in NN, forall n > N, g(n) != 0$ then $f = o(g) <=> lim_(n -> infinity) (f(n))/(g(n)) = 0$.
  - $f = O(g) <=> exists M > 0, exists N in NN, forall n > N, (f(n))/(g(n)) < M.$
]

notice that $n$ usually represents some variable of the quantity of data given by the algorithm. Depending on the context, we may take it to be the amount of elements in a list, the number of digits in a number and multiple other things.

#exm[
  Consider the following linear programming problem with $A in DD^(n times m)$ and $b in DD^m$, here $DD$ is the set of numbers that can be represented in the decimal base with finite digits.
  $
    (I) quad cases(
      limits(max)_(c in RR^n) c^t x,
      A x = b
    )
  $
  we can calculate the amount of bits needed to some $alpha in DD$ with this formula $ceil.l log_2(|alpha| + 1) ceil.r$ and thus we get that the amount of bits needed to represent the problem $(I)$ is $T = ceil.l log_2(|alpha_1| + 1) ceil.r n m + ceil.l log_2(|alpha_2| + 1) ceil.r m$ where the first term is to calculate how much the matrix $A$ needs in bits and the second is for the vector $b$.
]

#ooc[
  #sect("Formalism Of Computation")
  It can be noticed that in the prior definitions we did not formalize properly what is a "step" or an "algorithm", this is the goal of this section. For computations, we have a whole theory revolving around abstract computers called Computability Theory. For brievity, we will describe Turing machines directly and the concept of universality of computing machines.

  We assume that the machines will just work with data written in ${0, 1}$ alphabets, denote ${0,1}^* = union_(n >= 0) {0, 1}^n$ be the set of all possible binary strings, and we assume that any mathematical object $x$ will be represented in these machines using some convention or cannonical representation denoted $repr(x)$ or directly $x$ is the context is clear.

  #def(name: "Turing Machine")[
    Let $M = (Gamma, Q, delta)$, $M$ is said to be a TM (Turing Machine) if it satisfies
    + $Gamma = {0, 1, sp, bl}$ the set of alphabet of $M$ used on the work tape.
      - $sp$ is the start pointer.
      - $bl$ is the blank symbol.
      - $0, 1$ are symbols for intermediate calculations.
    + $Q={q_"start", q_"halt", ...}$ is the set of states that $M$ can be in.
      - $q_"start"$ is the state that the machine starts with.
      - $q_"halt"$ is the state that if the machine is in, ends the workflow.
    + $delta: Q times Gamma^k -> Q times Gamma^(k-1) times {L, S, R}^n$ a transition function.
      - $L$ is moving the tape pointer left.
      - $R$ is moving the tape pointer right.
      - $S$ is not moving the pointer.
  ]

  A turing machine can be thought of as a person given a problem $P$ that is subdivided to subproblems $P_1, dots, P_n$, and we give him infinite paper (scratchpad) to do the intermediate solutions, $Gamma$ represents the possible symbols he can use on the scratchpad, for example the "English" language with basic mathematical notations, the states represent what subproblem $P_i$ he is solving, and $delta$ is the work he is doing, from writing the intermediate calculations and not changing the paper, to changing papers to do different subproblems.
  
  #def(name: "Running Time")[
    Let $f: {0,1}^* -> {0,1}^*$  and $T: NN -> NN$ be two maps and $M$ a Turing machine. We say that $M$ computes $f$ in $T(n)$-time if for every $x in {0, 1}^*$, if we set the input of $M$ as $x$ then after at most $T(|x|)$ transition, $f(x)$ is written on the output and $M$ halts.
  ]
  
  thus this measure is independent of the time that each transition goes, and using the definitions we have earlier, we can give upperbounds for the growth of an algorithm depending on its input's size. The most important result is the following theorem which allows us to simulate turing machines inside of others in an efficent manner.

  #thm(name: "Efficent Universal Turing Machine")[
    There exists a Turing machine $cal(M)$ such that for every $x, alpha in {0, 1}^*, cal(M)(x, alpha) = M_alpha (x)$ where $M_alpha$ is the Turing machine represented with $alpha$.
  ]

  $alpha$ here represents a "program", and thus we can program any Turing machine behavior inside of the universal Turing machine $cal(M)$.
]
