#import "@preview/commute:0.3.0": arr, commutative-diagram, node

#import "@THR/Course:1.0.0": *
#show: template.with(
  cover: (
    title: "Number Theory & Cryptography",
    writer: "HADIOUCHE Azouaou",
    disclaimer: [This document contains the lectures given by Dr. ZAIMI.],
    comment: [Some contents were added as remainders and extras for the students.],
  ),
)

#let Id = math.op("Id")
#let Ker = math.op("Ker")
#let Im = math.op("Im")
#let Irr = math.op("Irr")
#let iso = $tilde.equiv$
#let char = math.op("Char")
#let card = math.op("#")
#let Aut = math.op("Aut")
#let order = math.op("ord")

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
  Let $G$ be a $p$-group, $cal(Z)(G)$ the center of $G$ and consider the action on $G$ defined by $G times G -> G, (g, x) |-> g x g^(-1)$. Let $O_x_1, dots, O_x_k$ be the distinct orbits for this action. Notice that $forall x in X, O_x = {x} <=> forall g in G, g x g^(-1) = x <=> forall g in G, g x = x g <=> x in cal(Z)(G)$. Suppose that $card G = p^n$, then is either $card O_x_i = 1$ or $card O_x_i = p^(n_i)$ and suppose that $cal(Z)(G) = {x_1, dots, x_s}$. Thus by the class equation $ card G = card X & = sum_(i=1)^s card O_x_i + sum_(i=s+1)^n card O_x_i \
              p^n & = s + (p^(n_(s+1)) + dots.c + p^(n_k)) \
                s & = p^n - (p^(n_(s+1)) + dots.c + p^(n_k)) $
  $s >= 1$ given that $e in cal(Z)(G)$ and since $p$ divides the RHS then it divides $s$ so the center is a $p$-group.
]

#cor(name: "Cauchy")[
  Let $G$ be a finite group and let $p$ a prime number that divides $card G$, then there is an element in $G$ of order $p$.
]

#prf[
  We have already proven this result for the case where $G$ is abelian. Suppose that $G$ is non-abelian. Consider $card G = n$. For $n = 1$, the result is trivial. Suppose that the result is true for all non-abelian groups of order less than $n$. If there is a subgroup $H$ of $G$ whose order is divisible by $p$, we get the result from the induction hypothesis. So suppose that $card H equiv.not 0 mod p$ for all subgroups $H$ of $G$ with $H != G$. Consider the conjugation action $g dot.c x = g x g^(-1)$. We have that $O_x = {x} <=> x in cal(Z)(G)$. Let $O_x_1, dots, O_x_r$ be the orbits of the action where $x_1, dots, x_s$ are in $cal(Z)(G)$. Then by class equation we have $card G = s + sum_(i=s+1)^r O_x_i$, on the other hand $card O_x_i = card G \/ card S_x_i$, we have that $card O_x_i > 1$ for $x_i in.not cal(Z)(G)$, $p$ does not divide $card S_x_i$ and it divides $card G$ thus it divides $card O_x_i$, it follows that $p$ divides $s$ and thus $p | card cal(Z)(G)$ which is a contradiction.
]

#thm(name: "First Sylow Theorem")[
  Let $G$ be a finite group of order $p^n m$ with $n, m in NN$, $p$ prime and $p divides.not m$, then $forall k in [|1, n|]$ there is a subgroup of order $p^k$.
]

#prf[
  We use induction on $k$.
  - For $k = 1$, the result is true by Cauchy.
  - Suppose that the result is true for all $1 <= k <= n - 1$. Let $H$ be a subgroup of $G$ with order $p^k$, we have that $(N(H):H) equiv (G:H) mod p$ since $(G:H) = p^(n - k) m$ and so $p|(G:H) => p|(N(H):H)$. Consider $pi: N(H) -> N(H) \/ H$, the canonical surjection, $Ker pi = H$, $p|card (N(H)\/H)$ , by Cauchy's theorem, there exists a subgroup $K'$ of $N(H)\/H$ with order $p$. Then $pi^(-1)(K')$ is a subgroup $K$ of $N(H)$ containing $H$. Consider $pi|_K: K -> K'$, $Ker pi|_K = H$, the first isomorphism gives that $K\/H iso K'$ and thus $card K' = card H card K = p^k p = p^(k+1)$ and thus $K$ is a subgroup of $G$ such that $p^(k+1)$.
]

#def(name: "")[
  Let $G$ be a finite group with order $p^n m$, $n, m in NN$, $p$ prime and $p divides.not m$, then a subgroup of $G$ with order $p^n$ is called a Sylow $p$-subgroup of $G$.
]

Notice that the conjugate of a Sylow $p$-subgroup of $G$, is also a Sylow $p$-subgroup.

#thm(name: "Second Sylow Theorem")[
  All Sylow $p$-subgroups are conjugates, that is, if $P_1$ and $P_2$ have order $p^n$, then $exists g in G, P_2 = g P_1 g^(-1)$.
]

#prf[
  Consider the action $P_2 times cal(L)_(P_1) -> cal(L)_(P_1), y dot.c g P_1 = (y g) P_1$. Suppose that $O_(g P_1) = {g P_1}$ that is $forall y in P_2, y dot.c g P_1 = g P_1 => g^(-1) y g in P_1 => g^(-1) P_1 g subset P_2$ and since $card P_2 = card g^(-1) P_2 g = card P_1$ thus $g^(-1) P_1 g = P_2$. Hence, if there is a fixed point for this action then $P_2$ and $P_1$ are conjugates. On the other hand, the class equation gives $ m = (m p^n) / (p^n) = (card G) / (card P_1) = card cal(L)_(P_1) = sum_(i = 1)^s card O_(g_i P_1) + sum_(i=b+1)^r card O_(g_i P_1) $
  where the first $s$ orbits are of order $1$ and the remaining are of order $>1$, we have $ card O_(g_i P_1) = (card P_2)/(card S(g_i P_1)) => forall i in [|s+1, dots, r|], p|card O_(g_i P_1) $ Hence $p|card_(i=s+1)^r card O_(g_i P_1)$ and $p$ does not divide $m$ thus $p$ does not divide $sum_(i=1)^s card O_(g_i P_1)$ thus $sum_(i=1)^s card O_(g_i p) != 0$.
]

#ntt[
  We denote the number of Sylow $p$-subgroups of a group $G$ as $n_p$.
]

#cor[
  If $G$ is abelian finite and $p | card G$ prime then $n_p = 1$.
]

#thm(name: "Third Sylow's Theorem")[
  Let $G$ be a finite group with order $p^n m$, $n, m in NN, p$ prime and $p divides.not m$, $n_p equiv 1 mod p$ and $n_p$ divides $m$.
]

#prf[
  We will prove that $n_p$ divides $card G$. We have that $n_p equiv 1 mod p$. Let $phi$ set of Sylow $p$-subgroups $ G times phi & -> phi \
       (g, P) & |-> g P g^(-1) $ Let $P in phi$ then $O_p = phi$ by theorem $2$, then the class equation gives $ n_p = card phi = card O_p = (G:S_P) $ and $card O_p$ divides $card G$ then $n_p$ divides $card G$.
]

#chapter[Product Groups][]

#section[Direct Product]
For a set $S_1, dots, S_n$ their product denoted by $S_1 times dots.c times S_n = product_(i=1)^n S_i$ is the set $ S_1 times dots.c times S_n = {(x_1, dots, x_n) | forall i in [|1, n|], x_i in S_i} $

#def(name: "Product Group")[
  Let $G_1, dots, G_n$ be groups, we define the product group of $G_i$, as the group $G = G_1 times dots.c times G_n$ with the component wise operation, that is $(a_1, dots, a_n) (b_1, dots, b_n) = (a_1 b_1, dots, a_n b_n)$.
]

#pro[
  The product group is indeed a group.
]

#pro[
  + $G$ abelian $<=>$ $forall i, G_i$ abelian.
  + $forall i, G_i$ finite $=>$ $G$ finite and $card G = product_(i=1)^n card G_i$.
  + The direct sum is written $plus.o.big_(i=1)^n G_i$ where $G_i$ are abelian.
]

#pro[
  $ZZ_n times ZZ_m$ cyclic $<=>$ $gcd(n, m) = 1$.
]

#prf[
  $=>$ Suppose $ZZ_n times ZZ_m$ is cyclic, assume the contrary $gcd(n, m) = d != 1$. Let $(a, b) in ZZ_n times ZZ_m$, using Lagrange's theorem, we have that $ cases(
    (n m/d) a = m/d (n a) = 0,
    (n/d m) b = n/d (m b) = 0
  ) => (n m)/d (a, b) = (0, 0) $
  $arrow.l.double$ suppose that $gcd(n, m) = 1$, Let $H$ be a subgroup of $ZZ_n times ZZ_m$ generated by $(1, 1)$, the first coordinate $1 in ZZ_n$ yields a zero after $n$ summations, and $1 in ZZ_m$ after $m$ summations. Hence, to obtain $(0, 0)$ by adding $(1, 1)$ to itself, the number of summations must be a multiple of $m$ and $n$. Simultaneously, the order of $(1, 1)$ is $lcm(n, m) = n m\/gcd(n, m) = n m => card H = card ZZ_n times ZZ_m => H = ZZ_n times ZZ_m$, therefore, we have that $ZZ_n times ZZ_m$ is cyclic and $(1, 1)$ a generator.
]

#pro[
  Let $G_1, dots, G_n$ be groups and $a=(a_1, dots, a_n) in product_(i=1)^n G_i$ such that for all $i in [|1, n|]$, $a_i$ has order $r_i$ in $G_i$, then the order of $a$ is $lcm(a_1, dots, a_n)$.
]

#exm[
  Let $(8, 10, 4)$ in $ZZ_12 times ZZ_24 times ZZ_60$ we have:
  - Order of $8$ in $ZZ_12$ is $12/(gcd(12, 8)) = 12 / 4 = 3$.

  - Order of $10$ in $ZZ_24$ is $24/(gcd(24, 10)) = 24 / 2 = 12$.

  - Order of $4$ in $ZZ_60$ is $60/(gcd(60, 4)) = 60/4 = 15$.
  So the order $(8, 10, 4)$ in $ZZ_12 times ZZ_24 times ZZ_60$ is $lcm(3, 12, 15) = 2^2 dot.c 3 dot.c 5 = 60$.
]

#pro[
  $ZZ_(m_1) times dots.c times ZZ_(m_n)$ is cyclic $<=>$ $forall i != j, gcd(m_i, m_j) = 1$
]

#exm[
  - $ZZ_2 times ZZ_3 times ZZ_4$ is not cyclic.
  - $ZZ_2 times ZZ_3 times ZZ_5$ is cyclic and isomorphic to $ZZ_30, ZZ_4 times ZZ_6, ZZ_15 times ZZ_2, ZZ_3 times ZZ_10$.
  - For $n >= 1, n = p_1^(e_1) dots p_n^(e_n)$ with $p_i$ distinct primes, then $ZZ_n tilde.equiv ZZ_(p_1^(e_1)) times dots.c times ZZ_(p_n^(e_n))$.
  - $ZZ times ZZ$ is not cyclic, assume by contradiction that there exists $(a, b)$ a generator of $ZZ$, $(1, 0) = k (a, b) = (k a, k b) => k a = 1, k b = 0$, $k$ cannot be $0$ and thus necessarily $b = 0$, but $(a, 0)$ cannot be generator of $ZZ times ZZ$ since it cannot generate $(0, 1)$, and thus $ZZ times ZZ$ is not cyclic.
]

#def(name: "Internal Direct Product")[
  Let $G$ be a group and let $H_1, dots, H_n$ be normal subgroups of $G$ such that $forall g in G, exists!(h_1, dots, h_n) in H_1 times dots.c times H_n, g = h_1 dots h_n$ (uniquely) then $G$ is said to be an internal product of $H_i$
]

- For $n = 2$ , $G$ is an internal direct product of $H_1$ and $H_2$, $G = H_1 H_2$ with $H_1, H_2$ normal in $G$, and any element is written in a unique way is equivalent to saying $H_1 inter H_2 = {e}$.
- Consider the external direct product $G = G_1 times dots.c times G_n$, $e_i$ the neutral elements of $G_i$, let $H_i = { (e_1, dots, e_(i-1), g_i, e_(i+1), dots, e_n) | g in G_i}$, $H_i$ are normal subgroups of $G$, more specifically, $G$ is an internal direct product of $H_i$.

#thm[
  Suppose $G$ is an internal direct product of $H_1, dots, H_n$, then $G$ is isomorphic to the external direct product $H_1 times dots.c times H_n$.
]

#prf[
  Consider the map $ phi: G = H_1 times dots.c times H_n & -> H_1 times dots.c times H_n \
                     g = h_1 dots h_n & |-> (h_1, dots, h_n) $
  $phi$ is well-defined and surjective by definition.
  - $phi$ is a homomorphism: let $i != j$ and $(h_i, h_j) in H_i times H_j$, notice that if $h in H_i inter H_j$, we can write $h = h e = e h => h = e$ since it is an interior product. Also, $h_i (h_j h_i^(-1) h_j^(-1)) in H_i$ and $(h_i h_j h_i^(-1)) h_j^(-1) in H_j$ by normality, hence $h_i h_j h_i^(-1) h_j^(-1) = e => h_i h_j = h_j h_i$. Take $g = h_1 dots h_n$ and $g' = h'_1 dots h'_n$, then $phi(g g') = phi(h_1 dots h_n h'_1 dots h'_n) = phi(h_1 h'_1 dots h_n h'_n) = (h_1 h'_1, dots, h_n h'_n) = (h_1, dots, h_n) (h'_1, dots, h'_n) = phi(g) phi(g')$ thus $phi$ is a morphism.
  - $phi$ is injective: let $g = h_1 dots h_n$, $phi(g) = (e, dots, e) => g = e dots e = e$.
]

#chapter[Free Abelian Groups][]

For an abelian group $G$, the identity $e = 0$, operation $+$, $forall n in NN^*$ define $ 0 x = 0 \
n x = underbrace(x + dots.c + x, n)\
(-n) x = underbrace(-x + dots.c + -x, n) $

If $X subset G$, $X$ generates $G$ if $forall g in G, exists {x_i}_(i=1)^n subset X, exists {k_i}_(i=1)^n subset ZZ, g = k_1 x_1 + dots.c + k_n x_n$.

#pro[
  Let $X$ be a subset of a non-zero abelian group $G$. Then the following are equivalent:
  + $forall g in G\\{0}$, $g$ is uniquely written as a linear combination $g=k_1 x_1 + dots.c k_n x_n$ with non-null coefficients $k_i in ZZ^*$ and $x_i in X$.
  + $X$ generates $G$ and $forall n in NN^*, forall x_1, dots, x_n in X, forall k_1, dots.c, k_n in ZZ, k_1 x_1 + dots.c k_n x_n = 0 => k_1 = dots.c = k_n = 0$.
]

#prf[
  $1 => 2.$ since $0 = 0 x$ we have that $X$ generates $G$. If $X = {0} => G = {0}$ which is not the case thus $X != {0}$. Suppose now $k_1 x_1 + dots.c + k_n x_n = 0$, we have then $x_1 = 1 x_1 + 0 = 1 x_1 + k_1 x_1 + dots.c + k_n x_n = (1 + k_1) x_1 + k_1 x_1 + dots.c + k_n x_n$, from the uniqueness of writing we have that necessarily $k_1 + 1 = 1$ and $forall i in [|2, n|], k_i = 0$ thus $forall i in [|1,n|], k_i = 0$. $2 => 1.$ Suppose that for some $g in G\\{0}$, we have that $g = k_1 x_1 + dots.c + k_n x_n = l_1 y_1 + dots.c + l_m y_m$, by adding terms with zero coefficients we get that $g = k_1 x_1 + dots.c + k_n x_n + k_(n+1) x_(n+1) + dots.c + k_s x_s = m_1 x_1 + dots.c + l_n x_n + l_(n+1) x_(n+1) + dots.c + l_s x_s$, hence $0 = g - g = (x_1 l_1$
  #nte[Undone]
]

#def(name: "Free Abelian Group")[
  An abelian group having the property $1$ or $2$ is said to be free and $X$ is called a basis of $G$.
]

#exm[
  + $ZZ$ is free with basis ${1}$.
  + $ZZ^n$ is free with basis ${e_i = (0, dots, 0, 1, 0, dots, 0)}_(i=1)^n$
  + $ZZ_n$ is not free, we have that $forall a in ZZ_n, n a = 0$.
  + All finite groups are not free, since by Lagrange, if $G$ is a finite group with order $n$ then $forall g in G, n g = e$.
  + $QQ$ is not a free group. $Q$ is not cyclic, since if there exists $g = a/b$ such that $QQ = chevron.l g chevron.r$, then $a/(2b) = k a/b => 2 k = 1$ which is impossible since $k in ZZ$. If $QQ = chevron.l X chevron.r$ with ${a/b, c/d} subset X$, then we have that $b c a/b + (-d a) c/d = 0$.
]

#pro[
  Suppose $G$ is free with basis having $r$ elements, then $G$ is isomorphic to $ZZ^r$.
]

#prf[
  Let ${x_1, dots, x_n}$ be a basis of $G$, the following map is the isomorphism $ phi: G & -> ZZ^r, quad g = k_1 x_1 + dots.c + k_n x_n |-> (k_1, dots, k_r) $
]

#thm[
  Let $G$ be an abelian group, if $G$ has a basis with $r$ elements, then any basis of $G$ has $r$ elements.
]

#def(name: "Rank")[
  Let $G$ be a free abelian group, we say that it is free of rank $n$ if its basis has $n$ elements.
]

#pro[
  Let $G$ be a free abelian group with rank $n$ and basis ${x_1, dots, x_n}$, let $y_1, dots, y_n in G$ that satisfy $ underbrace(vec(y_1, dots.v, y_n), Y) = underbrace(mat(a_(11), dots, a_(1n); dots.v, dots.down, dots.v; a_(n 1), dots, a_(n n)), A) underbrace(vec(x_1, dots.v, x_n), X) $ then ${y_1, dots, y_n}$ is a basis for $G$ if and only if $det A = plus.minus 1$.
]

#prf[
  $=>$ suppose ${y_1, dots, y_n}$ is a basis for $G$, then we have also that
  $
      underbrace(vec(x_1, dots.v, x_n), X) = underbrace(mat(b_(11), dots, b_(1n); dots.v, dots.down, dots.v; b_(n 1), dots, b_(n n)), B) underbrace(vec(y_1, dots.v, y_n), Y)
  $ thus we get that $Y = A B Y$, by the uniqueness of writing the elements with the basis, we have that $A B = I$, then $det A det B = 1$ but since $A, B in ZZ^(n times n)$ then $det A, det B in ZZ => det A = plus.minus 1$. $arrow.l.double$ suppose now that $det A = plus.minus 1$, thus $A$ is invertible, we have that $X = A^(-1) Y$, set $B = A^(-1)$ then $x_i = sum_(j = 1)^n b_(i j) y_j$, since ${x_1, dots, x_n}$ is a basis then $forall g in G, g = sum_(i=1)^n lambda_i x_i = sum_(i=1)^n sum_(j=1)^n lambda_i b_(i j) y_j = sum_(j=1)^n (sum_(i=1)^n lambda _i b_(i j)) y_j$, and thus ${y_1, dots, y_n}$ is basis for $G$.
]

#def(name: "Finitely Generated Group")[
  Let $G$ be an abelian group, then $G$ is said to be finitely generated if there is a finite set $X$ generating $G$.
]

#exm[
  - If $G$ is a free group of rank $n$ then it is finitely generated.
  - If $G$ is finite then $G$ is finitely generated.
]

#pro[
  Let $G$ be a finitely generated abelian group, then there is a surjective homomorphism $ZZ^n$ to $G$ for some $n$.
]

#prf[
  Let ${x_1, dots, x_n}$ be a generating set of $G$, the following map is a surjective homomorphism $ZZ^n &-> G quad (k_1, dots, k_n) |-> k_1 x_1 + dots + k_n x_n$.
]

#thm[
  Let $G$ be a free abelian group with rank $n$. Let $H != {0}$ subgroup of $G$. Then, $H$ is a free of rank $s <= n$. Therefore, there is a basis ${v_1, dots, v_n} subset G$ and integers $2 <= d_1, dots, d_s$, $d_1 | d_2 | dots.c | d_s$ and ${d_1 v_1, dots, d_s v_s}$ is a basis of $H$.
]

#thm[
  Same hypothesis as before, $s = n$ if and only if $G\/H$ is finite. Moreover, if $s=n$ ${x_1, dots, x_n}$ is a basis for $G$, ${y_1, dots, y_n}$ a basis for $H$, $y_i = sum_(i=1)^n a_(i j) x_j$, then $card G\/H = abs(det(a_(i j)))$.
]

#pro[
  Let $G$ be a finitely generated group with $n$ generators, and $H$ a subgroup of $G$, then $H$ is finitely generated.
]

#thm[
  Let $G$ be a finitely generated abelian group. Then $G$ is a direct product of (possible) finite groups and (possible) free abelian groups. Also, $G$ is a direct product of cyclic groups.
]

#prf[
  Suppose ${x_1, dots, x_n}$ generates $G$, consider the homomorphism $ phi: ZZ^n -> G, (k_1, dots, k_n) |-> k_1 x_1 + dots.c + k_n x_n $ take $K = Ker h$, we consider the cases for $K$:
  - $K = {0}$: then $G iso ZZ^n$.
  - $K != {0}$: we have that $G iso ZZ^n \/ K$ by the first isomorphism theorem, since $ZZ^n$ is a free group and $K$ is a subgroup of $ZZ^n$ then there is a basis ${v_1, dots, v_n}$ of $ZZ^n$ and ${d_1 v_1, dots, d_s v_s}$ a basis of $K$ with $2 <= d_1, dots, d_s$ with $d_1 | d_2 | dots.c | d_s$, consider the map $psi: ZZ^n -> ZZ^n, k_1 v_1 + dots + k_n v_n |-> (k_1, dots, k_n)$ and we have that $psi(K) = {(k_1 d_1, dots, k_s d_s, 0, dots, 0) | k_1, dots, k_s in ZZ} = d_1 ZZ times dots.c times d_s ZZ times {0}^(n-s)$, and thus we get $ ZZ^n\/K & iso (ZZ times ZZ times dots.c times ZZ)/(d_1 ZZ times d_2 ZZ times dots.c times ZZ_s times {0}^(n-s)) iso ZZ_(d_1) times dots.c times dots.c ZZ_(d_s) times ZZ^(n-s) $
]

#cor[
  Let $G != {0}$ be a finite abelian group, then there exists $d_1, dots, d_s in NN_(>=2), d_1 | d_2 | dots.c | d_s$, $G iso ZZ_(d_1) times dots.c times ZZ_(d_s)$.
]
