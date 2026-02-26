#import "@preview/commute:0.3.0": node, arr, commutative-diagram

#import "@THR/Wide:1.0.0": *
#show: template.with(
  title: "Number Theory & Cryptography",
  writer: "HADIOUCHE Azouaou",
  disclaimer: [This document contains the lectures given by Dr. ZAIMI.],
  comment: [Some contents were added as remainders and extras for the students.],
)
#set enum(numbering: "1.1.")

#let subset = $subset.eq$
#let Id = math.op("Id")
#let Ker = math.op("Ker")
#let Im = math.op("Im")
#let Irr = math.op("Irr")
#let iso = $tilde.equiv$
#let char = math.op("Char")
#let card = math.op("#")
#let Aut = math.op("Aut")
#let order = math.op("ord")

#__chp-sect-count.update(2)
#chapter[Group Actions][]

#def(name: "Group Actions")[
  Let $G$ be a group and $X != emptyset$, we say that $G$ acts (operates) on $X$ if there is a homomorphism $phi: G -> cal(S)(X)$ the group of permutations of $x$.
]

To avoid complicated notation, we denote $phi(g)(x) = phi_g (x)$ as $g dot.c x$. Notice in this case $e dot.c x = phi(e)(x) = Id(x) = x$ and $(g_1 g_2) dot.c x = phi(g_1 g_2) (x) = phi(g_1) compose phi(g_2) (x) = g_1 dot.c (g_2 dot.c x)$.

#def(name: "Group Actions")[
  Let $G$ be a group and $X != emptyset$ if there is a map $G times X -> X, (g, x) |-> g dot.c x$ where it satisfies the following two identities for any $x in X$, $g_1, g_2 in G$, $e dot.c x = x$ and $g_1 g_2 dot.c x = g_1 dot.c (g_2 dot.c x)$ then we say that $G$ acts on $X$.
]

The two previous definitions are equivalent.

#def(name: "Orbit/Stabilizer")[
  Let $G$ be a group acting on $X$ ($X$ is a $G$-set) and let $x in X$, we define the following
  + The orbit of $x$ as $O_x = { g dot.c x | g in G }$.
  + The stabilizer of $x$ as $S_x = { g in G | g dot.c x = x }$.
]

#pro[
  $S_x$ is a subgroup of $G$.
]

#prf[
  By definition $2$, we have $e dot.c x = x$ thus $e in S_x$. Let $g_1, g_2 in S_x$ then $g_1 dot.c x = x$ and $g_2 dot.c x = x$, so $g_1 g_2 dot.c x = g_1 (g_2 dot.c x) = g_1 x = x$ so $g_1 g_2 in S_x$. Also, $g_1 dot.c x = x => x = e dot.c x = g_1^(-1) (g_1 dot.c x) = g_1^(-1) dot.c x$ thus $g_1^(-1) in S_x$.
]

#pro[
  The relation defined on $X$ by $x cal(R) x' <=> x' in O_x$ is an equivalence relation and the class of $x$ is $O_x$.
]

#prf[
  Trivial.
]

#def(name: "")[
  + If $O_x = X$ for some $x in X$, then we say that $G$ acts transitively on $X$.
  + If $O_x = {x}$, then $x$ is said to be stable or fixed, in this case $S_x = G$.
]

#pro[
  Let $X$ be a $G$-set and let $x, y$ in the same orbit, then $S_x$ and $S_y$ are conjugates.
]

#prf[
  Let $y in O_x$, then $y = g x$ for some $g in G$. Let $h in S_x$, then $h x = x$, $(g h g^(-1)) (y) = g h x = g x = y$ therefore $g S_x g^(-1) subset S_y$ in a similar way we get $g^(-1) S_y g subset S_x$ by multiplying both sides by $g$ and $g^(-1)$ we get $S_y subset g S_x g^(-1)$ which gives that $S_y = g S_x g^(-1)$.
]

#pro[
  Let $X$ be a $G$-set, then there is a bijection between the set of left cosets of $S_x$ in $G$ and $O_x$.
]

#prf[
  Let $cal(L)$ be the set of left cosets. Consider the function $phi: cal(L) -> O_x, g S_x |-> g x$. $phi$ is well defined and injective since $g S_x = h S_x <=> h^(-1) g in S_x <=> h^(-1) g x = x <=> g x = h x <=> phi(g S_x) = phi(h S_x)$ and it is surjective by definition.
]

#cor[
  Let $G$ finite and let $X$ be a $G$-set then $card G = card O_x dot.c card S_x$.
]

#prf[
  By Lagrange theorem, we have that $card G = card S_x [G:S_x]$ and by the previous proposition we have $card G = card S_x [G:S_x] = card S_x card O_x$.
]

#cor(name: "Class Equation")[
  Let $G$ be finite and let $O_x_1, O_x_2, dots, O_x_n$ be the distinct orbits of $G$-set $X$ then $X$ is finite and $card X = sum_(i=1)^n card O_x_i$.
]

#def(name: "p-Group")[
  Let $G$ be a group of order $p^n$ where $p$ is a prime and $n in NN$, $G$ is said to be a $p$-group.
]

A subgroup of a $p$-group is also a $p$-group by Lagrange's theorem.


#cor(name: "Burnside")[
  The center of a $p$-group is a $p$-group.
]

#prf[
  Let $G$ be a $p$-group, $cal(Z)(G)$ the center of $G$ and consider the action on $G$ defined by $G times G -> G, (g, x) |-> g x g^(-1)$. Let $O_x_1, dots, O_x_k$ be the distinct orbits for this action. Notice that $forall x in X, O_x = {x} <=> forall g in G, g x g^(-1) = x <=> forall g in G, g x = x g <=> x in cal(Z)(G)$. Suppose that $card G = p^n$, then is either $card O_x_i = 1$ or $card O_x_i = p^(n_i)$ and suppose that $cal(Z)(G) = {x_1, dots, x_s}$. Thus by the class equation $
    card G = card X &= sum_(i=1)^s card O_x_i + sum_(i=s+1)^n card O_x_i\
    p^n &= s + (p^(n_(s+1)) + dots.c + p^(n_k)) \
    s &= p^n - (p^(n_(s+1)) + dots.c + p^(n_k))
  $
  $s >= 1$ given that $e in cal(Z)(G)$ and since $p$ divides the RHS then it divides $s$ so the center is a $p$-group.
]

#cor(name: "Cauchy")[
  Let $G$ be a finite group and let $p$ a prime number that divides $card G$, then there is an element in $G$ of order $p$.
]

#prf[
  We have already proven this result for the case where $G$ is abelian. Suppose that $G$ is non-abelian. Consider $card G = n$. For $n = 1$, the result is trivial. Suppose that the result is true for all non-abelian groups of order less than $n$. If there is a subgroup $H$ of $G$ whose order is divisible by $p$, we get the result from the induction hypothesis. So suppose that $card H equiv.not 0 mod p$ for all subgroups $H$ of $G$ with $H != G$. Consider the conjugation action $g dot.c x = g x g^(-1)$. We have that $O_x = {»} <=> x in cal(Z)(G)$. Let $O_x_1, dots, O_x_r$ be the orbits of the action where $x_1, dots, x_s$ are in $cal(Z)(G)$. Then by class equation we have $card G = s + sum_(i=s+1)^r O_x_i$, on the other hand $card O_x_i = card G \/ card S_x_i$, we have that $card O_x_i > 1$ for $x_i in.not cal(Z)(G)$, $p$ does not divide $card S_x_i$ and it divides $card G$ thus it divides $card O_x_i$, it follows that $p$ divides $s$ and thus $p | card cal(Z)(G)$ which is a contradiction.
]
