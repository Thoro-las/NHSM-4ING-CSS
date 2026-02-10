#import "@preview/commute:0.3.0": node, arr, commutative-diagram

#import "@THR/Wide:1.0.0": *
#show: template.with(
  title: "Information Theory & Error Correcting Codes",
  writer: "HADIOUCHE Azouaou",
  disclaimer: [This document contains the lectures given by Dr.Seffah.],
)
#set enum(numbering: "1.1.")

#let Z(m) = $ZZ \/ #m ZZ$
#let card = math.op("#")

#chapter("Remainders", num: 0)[]

#section(level: 1)[Congruences & $bold(ZZ\/m ZZ)$ Arithmetic]
#def(name: "Congruence Of Integers / Congruence Class")[
  Let $a, b, m in ZZ$ with $m > 0$, we say that $a$ is congruent to $b$ modulo $m$ and we write $a equiv b mod m$ if $m divides a - b$ which gives an equivalence relation. The class of $a$ in the congruence relation by $m$ is called the congruence class of $a$ modulo $m$, which is $overline(a) = a + m ZZ$.
]

#thm[
  Let $a, b, c, d in ZZ$ and $m in NN$, with $a equiv b mod m$ and $c equiv d mod m$ then we have the following statements are true:
  + $a + c equiv b + d mod m$.
  + $a - c equiv b - d mod m$.
  + $a c equiv b d mod m$.
]

We denote $ZZ\/m ZZ$, the set of all congruence classes modulo $m$.

#section(level: 1)[Euler $Phi$ Function]
#def(name: [$Phi$ Function])[
  The Euler $Phi$ function is defined as $Phi: ZZ -> NN$, where $Phi(n) = card { x in [|0, m-1|] | gcd(x, m) = 1}$.
]

#pro[
  Let $p$ be a prime number, then $Phi(p) = p - 1$ and $phi(p^r) = p^r - p^(r-1) = p^r (1 - 1/p)$.
]

#thm(name: "Euler")[
  Let $m$ be a positive integer modulo $a$ be an integer relatively prime to $m$ then $a^(Phi(m)) equiv 1 mod m$.
]

#thm(name: "Fermat")[
  Let $p$ be a prime, if the integer $a$ is not divisible by $p$ then $a^p equiv a mod p$.
]

#thm(name: "Lagrange")[
  Let $G$ be a finite group and $H$ a subgroup of $G$, then $card H divides card G$.
]

#section[Quadratic Residues]
#def(name: "Quadratic Residue")[
  Let $p$ be an odd prime and $a$ an integer not divisible by $p$, we say that $a$ is a quadratic residue modulo $p$ if there exists $x in ZZ$, such that $x^2 equiv a mod p$.
]

#thm[
  An integer $a$ is a quadratic residue modulo $p$ if and only if $gcd(a, p) = 1$ and $a$ has a square rest modulo $p$.
]

#def(name: "Legendre Symbol")[
  Let $p$ be an odd prime, define the Legendre symbol as:
  $
    (a/p) = 
      cases(
        1 &"if" gcd(a, p) = 1 "and" a "is a quadratic residue" mod p,
        -1 &"if" gcd(a, p) = -1 "and" a "is not a quadratic residue",
        0 &"if" p "divides" a
      )
  $
]

#thm[
  Let $p$ be an odd prime for every integer $a$
  $
    (a/p) = a^((p-1)/2) mod p
  $
]

#exr[
  + Decompose into partial fractions in $RR[x]$ the rational function $
    x/(x^4 + x^2 + 1)
  $
  + Let $K$ be a commutative field, and let $p: x^2 + lambda x + mu$ be a monic polynomial of degree $2$, show that $p$ is reducible over $K$ if and only if it has a root in $K$.
  + Let $K = ZZ\/5 ZZ$ be the field of residue classes, factor the polynomial $(x^2 + 4)(x^2 + 3)$ into irreducible factors over $K$.
  + Still with $K = ZZ\/5 ZZ$, decompose into partial fractions the rational function $
    (x - 2)/((x^2 + 4)(x^2 + 3))
  $
]
