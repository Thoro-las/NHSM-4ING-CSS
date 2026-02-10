#import "@preview/lilaq:0.5.0" as lq: *

#import "@THR/Sum:1.0.0": *
#show: template.with(mainpage: false)

#let Oh = math.op("O")

#ctitle[Complexity TD Series Za3ma]

#exr(ovcount: false)[
  Asymptotic complexity of the functions
  - $6n^3 + 10n^2 + 5n + 2 -> Oh(n^3)$.
  - $3 log_2 (n) + 4 -> Oh(log_2 (n))$.
  - $2^n + 6n^2 + 7n -> Oh(2^n)$.
  - $7k + 2 -> Oh(1)$.
  - $4log(n) + n -> Oh(n)$.
  - $2log_(10) (k) + k n^2 -> n^2$
]

#exr(ovcount: false)[
  Compare the functions near infinity, for checking just use the fact that $abs(f(n) \/ g(n))$ is bounded near infinity, then $f(n) = Oh(g(n))$.

  $
    (1/3)^n < 17 < log(n) < n/(log(n)) <\
    sqrt(n) < n < (3/2)^n < 2^n
  $

  #align(center)[
    #{
      let n = linspace(2, 5)

      diagram(
        legend: (position: top + left, fill: white.opacify(-20%), inset: 1mm),
        width: 100%,
        height: 6cm,
        plot(label: [$1\/3^n$], n, n => calc.pow((1/3), n)),
        plot(label: [$17$], n, n => 17),
        plot(label: [$log(n)$], n, n => calc.log(n)),
        plot(label: [$n\/log(n)$], n, n => n / (calc.log(n))),
        plot(label: [$sqrt(n)$], n, n => calc.sqrt(n)),
        plot(label: [$n$], n, n => n),
        plot(label: [$(3\/2)^n$], n, n => calc.pow((3/2), n)),
        plot(label: [$2^n$], n, n => calc.pow(2, n)),
      )
    }
  ]
]

#exr(ovcount: false)[
  Find number of operations and complexity, given that we have no way to know what should be counted as a step or not, I will consider additions, declarations and evaluations to be elementary steps.
  - A: $1 + 2n^2 -> Oh(n^2)$.
  - B: $1 + 2 dot.c n dot.c 2n -> Oh(n^2)$.
  - C: $2 n^2(n+1)\/2 -> Oh(n^3)$.
]

#exr(ovcount: false)[
  Find number of operations and complexity, same here, just rewriting the program because of the extremely bad idententation.
  - $"f"_1$:
  #code[
    ```pcode
    x = 0;

    for i = 0 to n - 1 do
      for j = 0 to i - 1 do
        x = x + 1;
      end
    end
    ```
  ]
  $ 1 + 2n(n+1)\/2 -> Oh(n^2) $

  - $"f"_2$: 
  #code[
    ```pcode
    x = 0;
    i = n;

    while i > 1 do
      x = x + 1;
      i = i / 2;
    end
    ```
  ]
  $ 2 + 4log_2(n) -> Oh(log_2 (n)) $
  $log_2 (n)$ in this case from the fact that in each iteration, we halve how many steps we go through, thus, we need how many $2$ divides $n$ times to pass through all $n$, which is $log_2 (n)$ in this case ($2^k = n => k = log_2 (n)$).

  - $"f"_3$:
  #code[
    ```pcode
    x = 0;
    i = n;

    while i > 1 do
      for j = 0 to n - 1 do
        x = x + 1;
      end
      i = i / 2;
    end
    ```
  ]
  $ 2 + log_2(n)(2 + 2n) -> Oh(n log_2 (n)) $
  same reasoning here 

  - $"f"_4$:
  #code[
    ```pcode
    x = 0;
    i = n;

    while i > 1 do
      for j = 0 to i - 1 do
        x = x + 1;
      end
      i = i / 2;
    end
    ```
  ]
  $ 2 + sum_(j=0)^(ceil(log_2(n))) 4 n/2^j -> Oh(n)) $
  You can try it for $i = 2^k$ for some $k$, you can see that at each iteration, there would be $2^k$ evaluations and additions, thus giving the result.
]

#exr(ovcount: false)[
  +
    #code[
    ```pcode
    S := 1
    for i = 2 to n do
      S = S * i
    end
    return S
    ```
    ]
  + The complexity is $1 + 2(n-1) = Oh(n)$.
]

#exr(ovcount: false)[
  + + $T_1(n) = 9n^2 = Oh(n^2)$.
    + $T_2(n) = 100n + 96 = Oh(n)$.
  + + For $T_1$: $(n_0, c) = (1, 9)$ clearly.
    + For $T_2$: $(n_0, c) = (1, 200)$ since $200 n = 100 n + 100 n > 100 n + 100 > 100 n + 96$.
  + #align(center)[
    #table(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
      [$T_i$\\ $n$], [$1$], [$3$], [$5$], [$10$], [$14$],
      [$T_1$], [$9$], [$81$], [$225$], [$900$], [$1764$],
      [$T_2$], [$196$], [$396$], [$596$], [$1096$], [$1496$]
    )
  ]
  + #align(center)[#{
    let x = lq.linspace(0, 20)
    lq.diagram(
      xlabel: $n$,
      ylabel: $T_i (n)$,
      lq.plot(x, x => 9*calc.pow(x, 2)),
      lq.plot(x, x => 100*x + 96)
    )
  }]
  + for $n < 12$: $T_1$ is better, otherwise $T_2$ is better.
  + calling the algorithms with complexity $T_1$ and $T_2$ we get an algorithm of complexity $T_1 + T_2 + c$ where $c$ is a constant, and its complexity would be $Oh(n^2)$.
]

#exr(ovcount: false)[
  + #align(center)[
    #code(
      ```pcode
      input:
        - n: size
        - A: matrix of size n
        - B: matrix of size n
      output:
        - C: matrix product of A*B

      C = [][]
      for i = 0 to n-1
        for j = 0 to n-1
          for k = 0 to n-1
            C[i][j] += A[i][k] * B[k][j]
          end
        end
      end
      return C
      ```
    )
  ]
  + $T(n) = 3(n-1)^3 -> Oh(n^3)$.
]
