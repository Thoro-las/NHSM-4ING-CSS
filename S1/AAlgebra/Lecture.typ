#import "@preview/commute:0.3.0": node, arr, commutative-diagram
#import "@THR/Wide:1.0.0": *
#show: template

#let subset = $subset.eq$
#let Id = math.op("Id")
#let Ker = math.op("Ker")
#let Im = math.op("Im")
#let Irr = math.op("Irr")
#let iso = $tilde.equiv$


#mainpage("Matehmatical Tools For Cryptography", "HADIOUCHE Azouaou", "Zaimi")

#chap("Remainders")[
  This part will just be a remainder of the important definitions, propositions and theorems of the field extension course that are needed for this course. We assume that rings in this case are commutative rings with unity.
]

#sect("Rings & Homomorphisms")
#def(name: "Ring Homomorphism/Kernel/Image")[
  Let $R, R'$ be two rings and $f: R -> R'$ a map. We say that $f$ is a ring homomorphism if
  $ f(a+b) = f(a) + f(b). quad quad f(a b) = f(a) f(b). $
  define $Ker f = f^(-1)({0})$ and $Im f = f(R)$.
]

#pro[
  Let $f: R -> R'$ be a ring homomorphism
  - $Ker f$ is an ideal of $R$ and $Im f$ is a subring of $R'$.
  - $Ker f = {0} <=> f$ injective and $Im f = R' <=> f$ surjective.
  - If $R, R'$ are fields then $f equiv 0$ or $f(1)=1$.
]

#thm(name: "First Isomophism Theorem")[
  Let $f: A -> B$ be a ring homomorphism, then $Im f iso A \/ Ker f$ and for $I subset Ker f$ is an ideal then there exists a unique isomorphism $f_*: A \/ I -> B, f_*(x + I) = f(x)$ with $f = f_* compose pi$ and $pi(x) = x + I$ the cannonical surjection.
  #align(center)[
    #commutative-diagram(
      node-padding: (20mm, 10mm),
      node((0, 0), $A$),
      node((0, 2), $B$),
      node((0, 1), $A\/I$),
      arr($A$, $B$, $f$, curve: 20deg),
      arr($A$, $A\/I$, $pi$, label-pos: right),
      arr($A\/I$, $B$, $f_*$, label-pos: right)
    )
  ]
]

#colbreak()
#sect("Ideals, UFDs, PIDs & EDs")
#def(name: "Elements")[
  Let $R$ be a ring, we have the following:
  - *Unit:* $x in R$ is a unit if $exists y in R, x y = 1$, denoted $R^*$.
  - *Zero Divisor:* $x in R\\{0}$ is a zero divisor if $exists y in R, x y = 0$.
  - *Irreducible:* $x in R$ is irreducible if $x = x_1 x_2 => x_1 in R^* or x_2 in R^*$.
]

#def(name: "Ideals")[
  Let $R$ be a ring, $I subset R$ ideal, we have:
  - *Prime Ideal:* $I$ is prime if $forall a, b in R, a b in I => a in I or b in I$.
  - *Principal Ideal:* $I$ is principal if $exists x in R, I = (x) = x R$.
  - *Maximal Ideal:* $I$ is maximal if $forall M$ ideal#h(-1mm), $I subset M subset R => M = I$ or $R$.
]

#pro[
  Let $f: R -> R'$ be a ring homomorphism and let $I'$ be an ideal of $R'$ then $I=f^(-1)(I')$ is an ideal of $R$, if $I'$ is prime then $I$ is prime.
]

#thm[
  Let $R$ be a ring and $I, J$ ideals of $R$
  - $I$ is a prime ideal $<=>$ $R\/I$ is an integral domain.
  - $I$ is a maximal ideal $<=>$ $R\/I$ is a field.
  - if $I subset J$ then $(A\/I)\/(J\/I) iso A\/J.$
]

#def(name: "Domains")[
  Let $R$ be a ring, we have the following:
  - *Integral Domain:* $R$ is an integral domain if $x y = 0 => x = 0$ or $y = 0$.
  - *Principle Ideal Domain:* $R$ is a PID if for any ideal $I$ in $R$, $I$ is principle.
  - *Euclidean Domain:* $R$ is said to be an ED if $exists nu: R \/ {0} -> NN$ a valuation function, $forall a, b in R, exists q, r in R, a = b q + r$, $r = 0$ or $nu(r) < nu(b)$.
  - *Unique Factoriation Domain:* $R$ is a UFD if any element can be decomposed into a unique product of irreducible elements.
]

#colbreak()

#thm[
  - If $R$ is a UFD and $x in R$ is irreducible, then $(x)$ is prime.
  - If $R$ is an integral domain and a PID, every prime ideal is maximal.
  - ED $=>$ PID $=>$ UFD.
]

#sect("Ring Of Polynomials")
#def(name: "Ring Of Polynomials")[
  Let $R$ be a ring, we define $ R[X]={sum_(i in I) a_i X^i | I "finite", {a_i}_(i in I) subset R}. $
  to be the ring of polynomials on $R$, and for any $P in R[X]$ we set $ deg P = max { i in NN | X^i "has a non-zero coefficent in" P}. $
]

#def(name: "Polynomials")[
  Let $L\/K$ be a field extension and $P in K[X]$
  - *Minimal:* $P$ is the minimal polynomial of $alpha in L$ if it is the unique monic polynomial with the smallest degree which vanishes at $alpha$ denoted $Irr(alpha, K, x)$.
]

#pro[
  Let $K$ be a field, $P(X) in K[X]$ with $deg P in {2, 3}$ then we have that $P$ is reducible over $K$ $<=>$ $P$ has a zero in $K$.
]

#thm[
  Let $R$ be a ring
  - $R$ is an integral domain $=>$ $R[X]$ is an integral domain.
  - $P=sum a_i X^i$ is a unit in $R[X]$ $<=>$ $a_0 in R^*$ and $forall i >= 1, a_i $ nilpotent.
  - $P in R[X]$ irreducible $=>$  $R[X]\/(P)={sum_(i=0)^(deg P - 1) a_i alpha^i | a_i in R}$ .
  - Let $alpha$ a root of $P in R[X]$ then $Irr(alpha, K, X)$ divides $P$.
  - if $R$ is a field, $R[X]$ is a Euclidean domain with the valuation $nu(P)=deg P.$
]

#colbreak()
#pro(name: "Eisenstein's Criterions")[
  - Let $P(x)=a_0 + a_1 x + dots + a_n x^n in ZZ[X]$, if there is a prime $p$ such that $p | a_0, dots, p | a_(n-1), p^2 divides.not a_0$ and $p divides.not a_n$ then $P$ is irreducible over $QQ[X]$.
  - Let $P(X) in ZZ[X]$ and $phi: ZZ[X] -> ZZ_n[X]$ the extension of $k |-> k mod n$, if $deg phi(P) = deg P$ and $phi(P)$ is irreducible in $ZZ_n[X]$ then $P$ is irreducible in $QQ[X]$.
]

\
#sect("Field Extensions")
#def(name: "Extension/Degree Of Extension")[
  Let $L, K$ be two fields such that $K subset L$, we call $L$ a field extension of $K$ and we denote it $L\/K$, we define the degree of extension of $L$ on $K$ as $dim_K L$ if it is finite and $+infinity$ if it is infinite, and we denote it $[L:K]=dim_K L$.
]

#def(name: "Elements")[
  Let $K$ be a field and $x in K$.
  - *Algebraic:* $x$ is said to be algebraic if $exists P in K[X], deg P > 0, P(x) = 0$.
  - *Transcendental:* $x$ is said to be transcendental if it is not algebraic.
  - *Conjugate:* $alpha$ is said to be the conjugate of $beta$ if $beta$ is a root of $"Irr"(alpha, K, x)$.
]

#pro[
  If $alpha, beta$ are conjugates then $Irr(alpha, K, X) = Irr(beta, K, X)$.
]

#def(name: "Fields")[
  Let $K$ be a field
  - *Algebraically Closed:* $K$ is said to be algebraically closed if any algebraic extension of $K$ is $K$.
]

#colbreak()
#def(name: "Extensions")[
  - *$L\/K$ Algebraic Extension:* $forall x in L$, x is algebraic over $K$.
  - *$L\/K$ Transcendental Extension:* if it is not an algebraic extension.
  - *Algebraic Closure:* $overline(K)$ is an algebraic closure of $K$ if $overline(K)\/K$ is an algebraic extension and $overline(K)$ is algebraically closed.
]

#thm[
  Let $L \/ K$ be a field extension and $alpha_1, dots, alpha_n in L$ and set $alpha = (alpha_1, dots, alpha_n)$ then
  - $K[alpha_1][alpha_2]dots[alpha_n]=K[alpha_1, dots, alpha_n]={ P(alpha) | P in K[X_1, dots, X_n] }$ is the smallest ring containing $K$ and $alpha_1, dots, alpha_n$.
  - $K(alpha_1)(alpha_2)dots(alpha_n)=K(alpha_1, dots, alpha_n)={ P(alpha) \/ Q(alpha) | P, Q in K[X_1, dots, X_n], Q(alpha) != 0}$ is the smallest field containing $K$ and $alpha_1, dots, alpha_n$.
  - any extension of finite degree is algebraic.
]

#thm(name: "Steinitz")[
  + Any field is contained inside of an algebraically closed field.
  + Any two algebraic closures of a field are isomorphic.
]

#chap("Embeddings")[
  Consider in this chapter, $K, L, E, Omega$ denote fields, the lower-case elements are used for elements of fields.
]

#sect("Embedding")
#def(name: "Embedding")[
  Let $sigma: K -> L$ a homomorphism, if $sigma equiv.not 0$ then $sigma$ is an embedding from $K$ to $L$.
]

#def(name: "Extension/Restriction")[
  Suppose $E$ is an extension of $K$, $tau$ is an embedding of $E$ into $L$ such that $forall k in K, tau(k) = sigma(k)$, then $tau$ is called an extension $sigma$ and $sigma$ is called a restriction of $tau$ to $K$. Moreover if $sigma = Id_K$ then $tau$ is called a $K$-embedding of $E$ into $L$.
]

#exm[
  - The unique embedding $sigma: QQ -> CC$ is the identity, we prove $sigma(1)=1$, $sigma(n) = n$, $sigma(-n) = -n$, $sigma(a\/b)=sigma(a)\/sigma(b)$ by induction, then $sigma = Id$.
  - The embeddings $tau: QQ(sqrt(2)) -> CC$ has only two forms, given that $tau|_QQ = Id_QQ$ then $tau(a + b sqrt(2)) = a + b tau(sqrt(2))$ and since $tau(sqrt(2))^2 = tau(sqrt(2)^2) = tau(2) = 2 => tau(alpha)=sqrt(2)$ or $tau(alpha)=-sqrt(2)$.
]

#pro[
  Let $tau$ be a $K$-embedding of $L$ into $E$ where $K subset L$ and let $alpha in L$ be algebraic over $K$, then $tau(alpha)$ is a conjugate of $alpha$ over $K$.
]

#prf[
  Suppose $alpha$ algebraic of degree $d$ over $K$ and let $P="Irr"(alpha, K, x)$, we have $P(alpha)=0$ and $tau(P(alpha))= tau(sum k_i alpha^i)=sum tau(k_i) tau(alpha)^i = sum k_i tau(alpha)^i = P(tau(alpha))=0$ then $tau(alpha)$ is a conjugate of $alpha$.
]

We used the fact that $tau$ is a $K$-embedding in the evaluation $tau(k_i) = k_i$.

#pro[
  Let $K$ be a field, $overline(K)$ an algebraic closure of $K$, $alpha in overline(K)$ and let $beta in overline(K)$ be a conjugate of $alpha$ over $K$, then there is a $K$-embedding $tau:K(alpha) -> overline(K)$ which is a $K$-isomorphism of $K(alpha)$ into $K(beta)$ sending $alpha$ to $beta$.
]


#prf[
  Let $alpha, beta$ conjugates over $K$, then we have that $Irr(alpha, K, X) = Irr(beta, K, X)$. Define $I = (Irr(alpha, K, X))$, $nu_alpha: K[X] -> K[alpha]$ and $nu_beta: K[X] -> K[beta]$ such that $nu_alpha (P(X)) = P(alpha)$ and $nu_beta (P(X)) = P(beta)$ which are surjective by definition. We have that $Ker(nu_alpha) = Ker(nu_beta) = (Irr(alpha, K, X))$. From the first isomorphism theorem we have that there exists two isomophisms $(nu_alpha)_star: K[X]\/I -> K[alpha]$ and $(nu_beta)_star: K[X]\/I -> K[beta]$ such that $v_alpha = (v_alpha)_star compose pi$ and $v_beta = (v_beta)_star compose pi$. We also have that $K[alpha] = K(alpha)$ and $K[beta] = K(beta)$ since $alpha, beta$ are algebraic.

  Set $phi: K(alpha) -> K(beta), x |-> ((v_beta)_* compose (v_alpha)_*^(-1)) (x)$, $phi$ is the composition of isomophisms then it is an isomorphism, let $x in K, phi(x) = (v_beta)_*((v_alpha)^(-1)_*(x)) = (v_beta)_* (x + I) = x$ so $phi$ is a $K$-isomorphism and $phi(alpha)=(v_beta)_star ((v_alpha)^(-1)_*(alpha))=(v_beta)_star (I) = beta$.
]

#exm[
  Let $alpha = root(3, 2)$ we have $Irr(alpha, QQ, X) = X^3 - 2$, the conjugates of $alpha$ over $QQ$ are $alpha, j alpha, j^2 alpha$, there are the following embeddings:
  - $tau_1: QQ(root(3, 2)) -> QQ(root(3, 2))$ which is the identity.
  - $tau_2: QQ(root(3, 2)) -> QQ(j root(3, 2))$ with $tau_2(root(3, 2)) = j root(3, 2)$ an isomorphism.
  - $tau_3: QQ(root(3, 2)) -> QQ(j^2 root(3, 2))$ with $tau_3(root(3, 2)) = j^2 root(3, 2)$ an isomorphism.
  so there are exactly three embeddings.
]

#cor[
  Let $alpha$ be algebraic over $K$ of degree $n$, $alpha in overline(K)$ an algebraic closure of $K$ and let $s$ be the number of distinct conjugates of $alpha$ over $K$, then there are exactly $s$ embeddings of $K(alpha)$ into $overline(K)$ sending $alpha$ to its distinct conjugates.
]

#prf[
  Follows immediatly from applying the previous two propositions.
]

#colbreak()
#pro[
  Let $L\/K$ be an algebraic extension and $sigma$ a $K$-endomorphism of $L$, then $sigma$ is surjective.
]

#prf[
  Let $sigma: L -> L$ a $K$-embedding and $alpha in L$. Take $P = Irr(alpha, K, X)$ and set $C = {beta in L | P(beta) = 0}$ so $C$ is the set of conjugates of $alpha$ over $K$, $alpha in C eq.not emptyset$ and $C$ is finite since $P$ has finite roots. For any $beta in C, sigma(beta) in C$ since $P(sigma(beta))=sigma(P(beta))=0$, $sigma$ is an injection from a finite set to itself so $sigma(C) = C$ thus $exists beta in C, sigma(beta) = alpha$ so $sigma$ is surjective.
]
