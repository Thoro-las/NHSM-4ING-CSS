#import "@THR/Wide:1.0.0": *
#show: template

#mainpage([Combinatorial Optimization], [HADIOUCHE Azouaou], [Berrachedi])

#chap("Remainders")[]
#sect("Unidimensional Optimization")
Let $f: I subset RR -> RR$ be a map, we have the following iterative methods to find the extremum points of $f$.

+ *Newton-Raphson Method:* for $f in cal(C)^2(I)$, we look for $x$ such that $f'(x)=0$, we define the sequence of points as $x_0$ is given near the solution and the iteration $x_(n+1) = x_n - f'(x_n) \/ f''(x_n)$.
+ *Secant Method:* for $f in cal(C)(I)$, we approximate $f''$ with the secant of $f'$ on the points $(x_(n-1), f'(x_(n-1)))$ and $(x_n, f'(x_n))$, thus we get the iteration $x_(n+1)=x_n - f'(x_n) dot (x_n - x_(n-1))\/(f'(x_n)-f'(x_(n-1)))$.
+ *Binary *

#chap("Introduction")[
  Optimization in general is the process of finding minimum or maximum of numerical functions, i.e. functions $f: E -> RR$ where $E$ is a set. In the case of combinatorial optimization, we consider the set to be discrete, that is, we take the sets to be finite or countable. The notations and the terminology all comes from the Continuous Optimization course.
]


