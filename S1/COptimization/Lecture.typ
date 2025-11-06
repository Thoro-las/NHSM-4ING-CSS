#import "@THR/Wide:1.0.0": *
#show: template.with(
  title: "Combinatorial Optimization",
  writer: "HADIOUCHE Azouaou",
  disclaimer: "This course extremely losely follows what Mr.Berrachedi is supposed to mean."
)


// #chapter("Remainders")[]
// #section("Unidimensional Optimization")
// Let $f: I subset RR -> RR$ be a map, we have the following iterative methods to find the extremum points of $f$.
//
// + *Newton-Raphson Method:* for $f in cal(C)^2(I)$, we look for $x$ such that $f'(x)=0$, we define the sequence of points as $x_0$ is given near the solution and the iteration $x_(n+1) = x_n - f'(x_n) \/ f''(x_n)$.
// + *Secant Method:* for $f in cal(C)(I)$, we approximate $f''$ with the secant of $f'$ on the points $(x_(n-1), f'(x_(n-1)))$ and $(x_n, f'(x_n))$, thus we get the iteration $x_(n+1)=x_n - f'(x_n) dot (x_n - x_(n-1))\/(f'(x_n)-f'(x_(n-1)))$.
// + *Bisection Method:* for $f in cal(C)(I)$, we approximate a zero of $f'$ using bisections, by taking an interval $[a, b]$ and dividing the interval into two parts $[a, (a + b)\/2]$ and $[(a + b)\/2, b]$ and do the same process on the one of them where the function changes the sign.
//
// #chapter("Introduction")[
//   Optimization in general is the process of finding minimum or maximum of numerical functions, i.e. functions $f: E -> RR$ where $E$ is a set. In the case of combinatorial optimization, we consider the set to be discrete, that is, we take the sets to be finite or countable. The notations and the terminology all comes from the Continuous Optimization course.
// ]
//

#chapter("Optimization Problems")[]

#nte[
  These will be added later... probably
  - Vector comparision
  - Problem notation
]

#section("Transformation Of C.O. Problems")
We consider the following integer optimization problem, $
  ("INP") #h(2mm) cases(
    max c dot x,
    A x <= b,
    x in NN^m
  )
$
with $A in ZZ^(n times m), b in ZZ^m, c in ZZ^m$.
- A special case of this is a binary variable problem (BVP), where we take the variable we want to optimize on $x$ to be binary, that is, $x in {0, 1}^m$. The knapsack is a special case where the $b$ is the volume and $A$ is the volume of each element, while $c$ is their usefulness and $x$ represents either taking it or not.

If we take by hypothesis that $cal(D)$ is bounded, notice that the set $S subset cal(D)$ that satisfies the INP problem are finite.
#nte[Proof will be written in a bit]
