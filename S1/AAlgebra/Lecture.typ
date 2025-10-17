#import "@preview/commute:0.3.0": node, arr, commutative-diagram
#import "@THR/Wide:1.0.0": *
#show: template

#let subset = $subset.eq$
#let Id = math.op("Id")
#let Ker = math.op("Ker")
#let Im = math.op("Im")
#let Irr = math.op("Irr")
#let iso = $tilde.equiv$
#let char = math.op("Char")
#let card = math.op("#")


#let __sum-content = state("sum-content", [])
#let add-to-summary(content) = {
  sum-content.update(sum => {[#sum, t]})
}

#mainpage("Matehmatical Tools For Cryptography", "HADIOUCHE Azouaou", "Zaimi", comment: [Some contents were added as remainders for the students])

#chap("Remainders", num: 0)[
  This part will just be a remainder of the important definitions, propositions and theorems of the field extension course that are needed for this course. We assume that rings in this case are commutative rings with unity.
]

#ooc[
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

  #pro(name: "Eisenstein's Criterions")[
    - Let $P(x)=a_0 + a_1 x + dots + a_n x^n in ZZ[X]$, if there is a prime $p$ such that $p | a_0, dots, p | a_(n-1), p^2 divides.not a_0$ and $p divides.not a_n$ then $P$ is irreducible over $QQ[X]$.
    - Let $P(X) in ZZ[X]$ and $phi: ZZ[X] -> ZZ_n[X]$ the extension of $k |-> k mod n$, if $deg phi(P) = deg P$ and $phi(P)$ is irreducible in $ZZ_n[X]$ then $P$ is irreducible in $QQ[X]$.
  ]

  \
  #sect("Field Extensions")
  #def(name: "Extension/Degree Of Extension")[
    Let $L, K$ be two fields such that $K subset L$, we call $L$ a field extension of $K$ and we denote it $L\/K$, we define the degree of extension of $L$ on $K$ as $dim_K L$ if it is finite and $+infinity$ if it is infinite, and we denote it $[L:K]=dim_K L$
  ]

  #def(name: "Characteristic")[
    we define the characteristic of $K$ to be the smallest $n$ such that $1 + 1 + dots + 1 = 0$ $n$ times, denoted $char K = n$, if $n$ does not exist then we say that $char K = 0$.
  ]

  #def(name: "Elements")[
    Let $K$ be a field and $x in K$.
    - *Algebraic:* $x$ is said to be algebraic if $exists P in K[X], deg P > 0, P(x) = 0$.
    - *Transcendental:* $x$ is said to be transcendental if it is not algebraic.
    - *Conjugate:* $alpha$ is said to be the conjugate of $beta$ if $beta$ is a root of $"Irr"(alpha, K, x)$.
  ]

  #pro[
    - If $alpha, beta$ are conjugates then $Irr(alpha, K, X) = Irr(beta, K, X)$.
    - If $L \/ K$ then $char L = char K$.
    - if $K$ is a field then $char K$ is prime.
  ]

  #def(name: "Fields")[
    Let $K$ be a field
    - *Algebraically Closed:* $K$ is said to be algebraically closed if any algebraic extension of $K$ is $K$.
  ]

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
  #prfout[
    + $P(X) = Irr(alpha, K, X) = Irr(beta, K, X)$ since they are conjugates.
    + $K[alpha] = K(alpha), K[beta] = K(beta)$ since they are algebraic.
    + $K(alpha) iso K[X]\/(P(X)) iso K(beta)$.
    + Construct using those isomorphisms a map that keeps $K$ invariant.
  ]
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

#pro[
  Let $L\/K$ be an algebraic extension and $sigma$ a $K$-endomorphism of $L$, then $sigma$ is surjective.
  #prfout[
    + $sigma$ transforms a conjugate to another.
    + the conjugates of an element are finite so $sigma$ is a bijection.
    + $sigma$ is a permutation thus there is a preimage for any element.
  ]
]


#prf[
  Let $sigma: L -> L$ a $K$-embedding and $alpha in L$. Take $P = Irr(alpha, K, X)$ and set $C = {beta in L | P(beta) = 0}$ so $C$ is the set of conjugates of $alpha$ over $K$, $alpha in C eq.not emptyset$ and $C$ is finite since $P$ has finite roots. For any $beta in C, sigma(beta) in C$ since $P(sigma(beta))=sigma(P(beta))=0$, $sigma$ is an injection from a finite set to itself so $sigma(C) = C$ thus $exists beta in C, sigma(beta) = alpha$ so $sigma$ is surjective.
]

#sect("Primitive Element Theorem")
Let $K$ be a field and $overline(K)$ an algebraic closure of $K$, and let $alpha in overline(K)$ and $alpha$ is a zero of $P(X) in K[X]\\{0}$, recall that $alpha$ is said to be a zero of $P$ is $P(X) =(X-alpha)^m Q(X)$ with $Q in K[X]$, if $m >= 2$ we say that $alpha$ is a repeated zero of $P$, if $m = 1$ we say that $alpha$ is a simple zero.

#def(name: "Derivative/Repeated Factor")[
  - Let $P in K[X]$ such that $P(X)=sum_(i=0)^n k_i X^i$, the formal derivative of $P(X)$ is defined by $P'(X) = sum_(i=1)^n i k_i X^(i-1)$.
  - Let $Q in K[X]$ of degree $>= 1$, then $Q$ is said to be a repeated factor of $P in K[X]$ if $P(X)=Q(X)^m R(X)$ for some $m >= 2$ and $R in K[X]$.
]

#pro[
  Let $K$ be a field with $char K = 0$, then we have that $deg P' = deg P - 1$, thus $P$ does not divide $P'$.
]
#prf[
  Let $P(X) = sum_(i=0)^n a_i X^i$, with $a_n != 0$, its derivative is defined as $P'(X) = sum_(i=1)^(n) i a_i X^(i-1)$, the coefficent of the highest degree is $n a_n$, which is not zero since $char K = 0$. Thus $deg P' = n - 1 = deg P - 1$.
]

#pro[
  Let $K$ be a field with $char K = 0$ and $P in K[X]$, then $P$ has a repeated factor in $K[X]$ $<=>$ $P, P'$ have a common factor. 
  #ooc[
    More precisely, if $Q in K[X]$ a repeated factor of $P$ then it divides both $P$ and $P'$. Conversely if $Q$ is irreducible and is a common divisor of $P$ and $P'$ then it is a repeated factor of $P$.
  ]
]
#prf[
  - $=>$ suppose that $P(X)=Q^m (X) R(X)$, $P'(X)=m Q^(m-1) (X) Q'(X) R(X) + Q^m (X) R'(X)$ then $Q$ divides both $P$ and $P'$.
  - $arrow.double.l$ suppose now that $P, P'$ have a common factor $Q$ irreducible which exists by the fact that $K[X]$ is a UFD, then $P(X) = Q(X) R(X)$ we get then that $P'(X) = Q'(X) R(X) + Q(X) R'(X)$ since $Q$ divides $P$ and $P'$ we have that it divides $Q'(X)R(X) = P'(X) - Q(X)R'(X)$ so $Q$ divides either $Q'$ or $R$, since $char K = 0$ then $Q$ does not divide $Q'$ so it necessarily divides $R$ then $R(X) = Q(X) R_1 (X)$, thus $P(X) = Q(X) R(X) = Q(X) Q(X) R_1 (X) = Q^2 (X) R_1 (X)$ so $Q$ is a repeated factor of $P$.
]

#cor[
  Let $P in K[X]$ irreducible and $char K = 0$ then $P(X)$ has no repeated zeros in any algebraic closure $overline(K)$.
  #prfout[
    + Consider the Bezout identity $P(X) U(X) + P'(X) V(X) = 1$.
    + Replace with the roots of $P(X)$ and deduce it doesn't nullify $P'$.
    + Deduce that the factor $(X-alpha)$ is not present in $P'$.
    + Deduce that $(X-alpha)$ is simple factor of $P$.
  ]
]

#prf[
  Let $P in K[X]$ be irreducible then $P' != 0$ and $P$ does not divide $P'$, if $Q$ is a common factor of $P$ and $P'$ then $Q$ divides $P$ and since $P$ is irreducible then $Q(X) = lambda P(X)$ thus $P$ divides $P'$, so $gcd(P(X), P'(X))=1$. By Bezout's theorem we have that $exists u, v in K[X]$ such that $P(X) u(X) + P'(X) v(X) = 1$, viewing this identity in $overline(K)[X]$, let $alpha$ be a zero of $P$ in $overline(K)$, replacing in the previous equation we have that $P(alpha) u(alpha) + P'(alpha) v(alpha) = P'(alpha) v(alpha) = 1$ then $P'(alpha)!=0$ so $(X-alpha)$ is not a factor of $P'$ so $P$ has no repeated factor $(X-alpha)$ then $P$ has no repeated zeros in $overline(K)$.
]

#cor[
  Let $K$ be a field of $char K = 0$ and $alpha$ be algebraic over $K$ of degree $d$ and let $Irr(alpha, K, X)=(X-alpha_1)dots(X-alpha_d)$ in $overline(K)[X]$, then there exists $d$ embeddings of $K(alpha)$ into $overline(K)$ of the form
  $sigma_i &: alpha |-> alpha_i$.
]
#prf[Use the previous corollary and the one of the existence of $s$ embeddings in this case to get $s = d$.]


#thm(name: "Primitive Element")[
  Let $L$ be a finite extension of a field $K$ with $char K = 0$ then there is $theta in L$ such that $L = K(theta)$.
  #prfout[
    + Simplify by induction to two elements $L = K(alpha, beta)$.
    + Take $P(X) = Irr(alpha, K, X)$, $Q(X) = Irr(beta, K, X)$.
    + Take $theta in K \\ {(alpha - alpha_i)\/(beta_j - beta) | (i, j) in [|1, n|] times [|2, m|] }$.
    + Consider $theta = alpha + k beta$ and $R(X) = P(theta - k X)$.
    + Prove that $k$ is the only common factor of $R$ and $Q$.
    + Deduce that $(X-beta) in K(theta)[X]$ and thus $beta in K(theta)$.
  ]
]

#prf[
  It is easy to notice that by induction, a proof for the existence of $theta$ when $L = K(alpha, beta)$ is sufficent. 

  Consider $L=K(alpha, beta)$. Consider the minimal polynomials 
  $
    P(X) &= Irr(alpha, K, X)limits(=)_(overline(K)[X])(X-alpha_1) dots (X-alpha_n) \
    Q(X) &= Irr(beta, K, X) limits(=)_(overline(K)[X]) (X-beta_1) dots (X-beta_m)
  $ 

   Let $k in K$ such that $forall i in [|1,n|], forall j in [|2, m|], k != (alpha - alpha_i)/(beta_j - beta)$ which exists since $char(K) = 0 => \# K = infinity$ and consider $theta = alpha + k beta$, clearly $K(theta) subset K(alpha, beta)$. 

  Consider the polynomial $R(X) = P(theta - k X)$, $deg R = deg P = n$ and $R in K(theta)[X]$, we have $R(beta)=P(theta - k beta) = P(alpha) = 0$ so $beta$ is a zero of $R$ and also a zero of $Q$. We want to prove that the only common zero of $R$ and $Q$ is $beta$, let $gamma$ be a zero of $R$ and $Q$ in $overline(K)$, $R(gamma) = P(theta - k gamma) = 0 => theta - k gamma = alpha_i$ so we get that $gamma$ satisfies $gamma = (theta - alpha_i)/k = (alpha - alpha_i)/k + beta$, since $gamma$ is a zero of $Q$ then $gamma = beta_j$ but this reduces to $k = (alpha-alpha_i)/(beta_j - beta)$ which is not true by choice of $k$ so $gamma = beta_1 = beta$. Thus the unique common zero of $Q$ and $R$ is $beta$ then $Irr(beta, K, X)$ divides both $Q$ and $R$ and is of degree one so $Irr(beta, K, X) = X - beta in K(theta)[X]$ thus we have $beta in K(theta)$.

  It is clear that $K(theta) subset K(alpha, beta)$ and we have that $beta in K(theta)$ then $alpha = theta - k beta in K(theta)$ since $k, theta, beta in K(theta)$ and thus $K(alpha, beta) = K(theta)$.
]

#exm[
  - to find the primitive of $QQ(sqrt(a), sqrt(b))$ with $a, b in ZZ$ non-perfect squares, we have that $Irr(sqrt(a), QQ, K) = X^2 - a$ and $Irr(sqrt(b), QQ, K) = X^2 - b$ thus $alpha_1 = sqrt(a), alpha_2 = - sqrt(a)$ and $beta_1 = sqrt(b), beta_2 = - sqrt(b)$ and thus we obtain that the set of non-allowed values of $k$ are ${0, sqrt(a\/b)}$, given that $a != b$ then $k=1$ is not in that list so we obtain that $ QQ(sqrt(a) + sqrt(b)) = QQ(sqrt(a) + sqrt(b)) $
]

#chap("Extensions Of Finite Fields")[
  The aim of this chapter is to study the structure of the finite fields and how to characterize them using their ground fields. Consider the fields $FF_p$ as the fields $ZZ_p$ with the modular addition and multiplication.
]

#sect("Finite Fields")
#pro[
  Let $F$ be a finite field with $card F = q$ and $E\/F$ a finite extension of degree $n$ then $card E = q^n$.
]

#prf[
  We have that $[E:F] = dim_F E = n$, thus $E iso F^n$ as an $F$-vector space, so $card E = card (F ^ n) = (card F)^n = q^n$.
]

#cor[
  Let $E$ be a finite field with $char E = p$, then $card E = p^n$ for some $n in NN^star$.
]

#prf[
  We have that $char E = p$, then it has a copy of $ZZ\/p ZZ$ by the isomorphism $phi: ZZ\/p ZZ -> E, n |-> 1 + 1 + dots + 1$, $n$ times, take $F = phi(ZZ\/p ZZ)$, it is a subfield of $E$, we get then that $card E = (card F)^n = p^n$ where $n = [E:F]$.
]

#thm[
  Let $E$ be a finite field with $card E = p^n$, then the elements of $E$ are precisely the zeros of the polynomial $X^(p^n) - X in FF_p [X]$ in a certain algebraic closure $overline(FF_p)$.
]

#prf[
  Let $P(X) = X^(p^n)-X$ and $cal(Z)(P) = {alpha in overline(FF_p) | P(alpha) = 0}$
  - $E subset cal(Z)(P)$: $card E = p^n$ then $card E^* = p^n - 1$ thus the multiplicative group $E^*$ is of order $p^n - 1$, by Lagrange's theorem, we have that $forall a in E^*$, $a^(p^n - 1) = 1$ thus we get that $a^(p^n) - a = 0$ so $P(a) = 0$ and notice also that $P(0) = 0$ thus we obtain $E = E^* union {0} subset cal(Z)(P)$.

  - $cal(Z)(P) subset E$: notice that $card cal(Z)(P) <= p^n$ since $deg P = p^n$ and $card E = p^n$ thus it is clear that $cal(Z)(P) subset E$.
  So we conclude that $cal(Z)(P) = E$.
]

#exm[
  + $E = FF_2$ with $n = 1$ and $p = 2$ then $FF_2$ are the zeros of $X^2 - X=X(X-1)$.
  + $E = FF_2(alpha)$ with $alpha^2 + alpha + 1 = 0$, we have that $E = {0, 1, alpha, alpha^2}$ and by the theorem the roots of $X^4 - X = X(X-1)(X^2 + X + 1)$ are the solutions.
]

#thm[
  Let $E$ be a finite field, then the group $E^*$ is cyclic.
]

#prf[
  Let $E$ be a finite field and $E^*=E\\{0}$ the multiplicative group of $E$, then $E^*$ is abelian and $card E^* = p^n - 1$ where $card E = p^n$, assume on the contrary that $E^*$ is not cyclic, so the order of any element of $E^*$ is strictly less than $p^n - 1$. Let $alpha in E^*$ of maximal order $s < p^n - 1$. Let $G = angle.l alpha angle.r = {alpha, alpha^2, dots, alpha^s}$ be the cyclic subgroup of $E^*$ generated by $alpha$. Any element of $G$ has an order that divides $s$ by Lagrange's theorem, $forall g in G, g^s = 1$ thus $g$ is a zero of $X^s - 1 in E[X]$, and since $deg (X^s - 1) = s$ then this polynomial has at most $s$ zeros, so $G$ are exactly the roots of $X^s - 1$ in $overline(FF_p)$, since $card G = s < p^n - 1 = card E^*$ then there exists $beta in E^*$ with $beta in.not G$. Let $t$ be the order of $beta$, $beta^t = 1$ and $t$ does not divide $s$
  $
    s = p_1^(l_1) p_2^(l_2) dots p_j^(l_j) dots p_r^(l_r) quad quad t=p_1^(k_1) p_2^(k_2) dots p_j^(k_j) dots p_r^(k_r)
  $
  with $p_i$ prime numbers and $l_i, k_i in NN$, $l_1 < k_1, l_j < k_j, l_(j+1) >= k_(j+1), dots, l_r >= k_r$.\ $j$ exists since $t$ does not divide $s$, set $u = p_1^(l_1) dots p_j^(l_j)$, $u' = s \/ u$, $v = p_1^(k_1) dots p_j^(k_j)$ and $v' = t \/ v$. Notice that $u < v$ and $gcd(u, v')=1$. Let $gamma = alpha^u beta^(v')$, $gamma in E^*$ since $alpha, beta in E^*$, $alpha^u$ is of order $u'$ and $beta^(v')$ is of order $v$ and since $u$ and $v'$ are coprime then the order of $alpha^u beta^v$ is $u' v > u' u = s$, contradiction with the fact that the maximal order is $s$.
]

#ooc[
  *Constructive Proof:* Let $q = card E$ and $q - 1 = product_(i=1)^k p_i^(l_i)$ by the  fundemental theorem of artihemtic. Consider for $i in [|1, k|]$ the polynomials $P_i (X) = X^((q-1)/p_i) - 1$, notice that $card cal(Z)(P_i) <= (q-1)/q_i < q-1 = card E^*$, thus there exists $y_i in E^* \\cal(Z)(P_i)$. Now for $i in [|1, k|]$ $z_i = y_i^((q-1)\/(p_i^(l_i)))$, notice that $z_i$ has order $p_i^(l_i)$ since $z_i^(p_i^(l_i))=y_i^(q-1)=1$ by Lagrange's theorem and $z_i^(p_i^(l_i - 1)) = y_i^((q-1)\/p_i) != 1$ by the definition of $y_i$. We chose $z = product_(i=1)^n z_i$, since all the orders of $z_i$ are coprime from the fact that they are different primes, then the order of $z$ is $product_(i=1)^n p_i^(l_i) = q - 1 = card E^*$, thus $E^* = angle.l z angle.r $ and $E^*$ is cyclic.

  #exm[
    Consider $FF_7$ then $p = 7$, $n = 1$ and $q = 7$
    $
      q-1 &= 6 = 2 dot 3
      => cases(p_1 = 2, l_1 = 1, p_2 = 3, l_2 = 1)
      => cases(P_1(X) = X^3 - 1, P_2(X) = X^2 - 1)\
      &=> cases(y_1 = 3, y_2 = 4)
      => cases(z_1 = 3^3 = 6, z_2 = 4^2 = 2)
      => z = 6 dot 2 = 5
    $
    its easy to verify that $angle.l 5 angle.r = FF_7^star$.
  ]
]

#cor[
  Let $E$ be a finite extension of a finite field $F$, then there exists a primitive element $theta in E$, $E = F(theta)$.
]

#prf[
  Consider $theta$ the generator of $E^*$ from the previous proposition. $F(theta) subset E$ since $theta in E^* subset E$ and $F subset E$. $E subset F(theta)$ given that $E^* = angle.l theta angle.r subset F(theta)$ and $0 in F subset F(theta)$ thus we obtain $E = {0} union E^* subset F(theta)$ hence $E = F(theta)$.
]

#thm[
  Let $n in NN^*$ and $p$ a prime number, there exists a unique field of order $p^n$ up to an isomorphism denoted $FF_(p^n)$.
]

#prf[
  Consider $P(X) = X^(p^n) - X$ in $overline(FF_p)$ and let $K={alpha in overline(FF_p) | P(alpha) = 0}$. We will prove that $K$ is a subfield of $overline(FF_p)$ containing $FF_p$.

  - $FF_p subset K$: let $alpha in FF_p$, we have $alpha^(p-1)=1$ by Langrange's theorem, thus $alpha^p = alpha$, by induction we have that $alpha^(p^i) = alpha$ thus $P(alpha) = alpha^(p^n) - alpha = 0$ so $alpha in K$.
  - $K$ is a field: Let $alpha, beta in K$, we have that $(alpha^(-1))^(p^n) = (alpha^(p^n))^(-1) = alpha^(-1)$, $(alpha beta)^(p^n) = alpha^(p^n) beta^(p^n) = alpha beta$ since $dot$ is commutative, $(alpha + beta)^(p^n)=sum_(i=0)^(p^n) binom(p^n, i) alpha^i beta^(p^n - i)$, since $K subset overline(FF_p)$ and $char overline(FF_p) = char FF_p = p$ then $forall i in [|1, p-1|], p | binom(p^n, i)$ thus we get $(alpha + beta)^(p^n) = alpha^(p^n) + beta^(p^n) = alpha + beta$.
  Thus $K$ is a subfield of $overline(FF_p)$ containing $FF_p$ and has $p^n$ elements since $overline(FF_p)$ is algebraically closed and $deg P = p^n$.
]

#cor[
  Let $F$ be a finite field, $F subset overline(FF_p)$ and $alpha in overline(FF_p)$, then the zeros of $Irr(alpha, F, X)$ are distinct, the conjugates of $alpha$ are all in $F(alpha)$ and so there are exactly $[F (alpha):F]$ embeddings which are all automorphisms.
]

#prf[
  we have $FF_p subset F subset F(alpha)$, $[F : FF_p] = d$ and $[F(alpha) : F] = n$ then we get $FF(alpha) iso FF_(p^(n d))$. The elements of $F(alpha)$ are zeros of $X^(p^(n d)) - X in FF_p [X]$ so $Irr(alpha, FF_p, X)$ divides $X^(p^(n d)) - X$ whose zeros are distinct so the zeros of $Irr(alpha, FF_p, X)$ are distinct. Let $sigma$ be an $F$-embedding of $F(alpha)$ then $sigma(alpha)$ is a conjugate of $alpha$ so $card F(alpha) = card F(sigma(alpha))$ thus $F(alpha) = F(sigma(alpha))$.
]

#exm[
  - $FF_2 = {0, 1}$, the set of cubic polynomials over $FF_2[X]$ are $P_1(X) = X^3 + X + 1$ and $P_2(X) = X^3 + X^2 + 1$.
]

#pro[
  Let $m, n in NN^*$ and $p$ prime then 
  #align(center)[$FF_(p^m)$ is a subfield of $FF_(p^n)$ $<=>$ $m$ divides $n$.]
]

#prf[
  $=>$ suppose that $FF_(p^m)$ is a subfield of $FF_(p^n)$, then $FF_(p^n)$ is an extension of $FF_(p^m)$ and we have that $n = [FF_(p^n):FF_p] = [FF_(p^n):FF_(p^m)]dot[FF_(p^m):FF_p] = k dot m$ thus $m$ divides $n$. $arrow.double.l$ suppose that $m$ divides $n$ so $n = k dot m$, let $alpha in FF_(p^m)$, by definition of $FF_(p^m)$ we have $alpha^(p^m) = 1$ so $alpha^(p^n) = alpha^(p^(k m)) = (alpha^(p^m))^(p^((k-1)m))= 1^(p^((k-1)m)) = 1$ thus $alpha in FF_(p^n)$, and since $FF_(p^m)$ is a field then it is a subfield of $FF_(p^n)$.
]

#cor[
  The number of subfields of $FF_(p^n)$ is equal to the number of positive divisors of $n$.
]
#prf[
  It is clear from the previous statement that the only subfields are divisors of $n$, denote them $d_1, dots, d_k$. Then the subfields of $FF_(p^n)$ are $FF_(p^(d_1)), FF_(p^(d_2)), dots, FF_(p^(d_k))$.
]

#colbreak()

#def(name: "Frobenius Automorphisms")[
  Let $f: FF_q -> FF_q$ where $q=p^n$ with $f: alpha |-> alpha^p$, then $f$ is called the frobenius automorphism of $FF_q$.
]

To justify this nomination, we will prove that it is a $FF_p$-automorphism 
- $f$ is well defined: since for $alpha in FF_q$, $alpha^p in FF_q$ thus $f(alpha) in FF_q$.
- $f$ is a $FF_p$-embedding: let $alpha, beta in FF_q$, $f(alpha + beta) = (alpha + beta)^p = alpha^p + beta^p = f(alpha) + f(beta)$ since $char FF_q = p$, $f(alpha beta) = (alpha beta)^p = alpha^p beta^p = f(alpha) f(beta)$. $f$ is injective since $Ker f = { alpha in FF_q | f(alpha) = 0} = {alpha in FF_q | alpha^p = 0} = {0}$ given its a field. Let $alpha in FF_p$, $alpha$ satisfies $alpha^p - alpha = 0$ thus $f(alpha) = alpha^p = alpha$.
Using Proposition 1.1.6, we deduce that $f$ is an automorphism of $FF_q$.

#pro[
  Let $alpha$ be algebraic over $FF_p$ of degree $n$ $(FF_p (alpha)=FF_(p^n))$ then the embeddings of $FF_p (alpha)$ into $overline(FF_p)$ are $f^(1), f^(2), dots, f^(n)$ where $f$ is the Frobenius automorphism of $FF_(p^n)$.
]

#prf[
  Notice that $f$ is an automorphism, thus $forall i in [|1, n|], f^i$ is an automorphism from $FF_(p^n)$ to $FF_(p^n)$ so is an embedding from $FF_(p)(alpha)$ to $overline(FF_p)$. Since $alpha$ is of degree $n$ then there are exactly $n$ embeddings, we will prove that all of them are of the form $f^i$.

  There $n$ embeddings $f^1, dots, f^n$, now we will prove that they are all not equal, that is $forall 1 <= i < j <= n, f^i equiv.not f^j$. Suppose that there exists $i, j in [|1, n|]$, $i < j$ such that $f^i equiv f^j$, $FF_p (alpha)$ is a finite field then there is a generator $theta$ for the multiplicative group $(FF_p (alpha))^* = angle.l theta angle.r$, $theta^(p^i) = f^i (theta) = f^j (theta) = theta^(p^j)$, so $theta^(p^j - p^i) = 1$ but $p^j - p^i < p^n$ and the order of $theta$ is $p^n$ which is a contradiction. Thus we conclude that ${f^i}_(i in [|1, n|])$ are the only embeddings of $FF_p (alpha)$ into $overline(FF_p)$.
]


// #exm[
//   Let $p$ prime $FF_p subset FF_(p^2) subset FF_(p^6)$. We have $[FF_(p^2) : FF_p] = 2$, $[FF_(p^6):FF_p]=6$, $[FF_(p^6):FF_(p^2)]=3$ and take $FF_(p^2) = FF_p (eta)$, $FF_(p^6) = FF_p (theta)$. We have that the set of emebeddings from $FF_(p^6) = FF_p (theta)$ into $overline(FF_p)$ are ${f^i}_(i in [|1, 6|])$ with $f(alpha) = alpha^p$.
// ]
