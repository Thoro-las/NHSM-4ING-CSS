#import "@preview/lilaq:0.5.0" as lq: *

#import "@THR/Sum:1.0.0": *
#show: template.with(mainpage: false)

#let Oh = math.op("O")

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
  Compare the functions near infinity $
    (1/3)^n < 17 < log(n) < n/(log(n)) <\
    sqrt(n) < n < (3/2)^n < 2^n
  $
]

#exr(ovcount: false)[
  Find number of operations and complexity
  - A: $1 + 2n -> Oh(n)$.
  - B: $1 + 2n(2n + n) -> Oh(n^2)$.
  - C: $2 (n(n+1))/2 n -> Oh(n^3)$.
]

#exr(ovcount: false)[
  Find number of operations and complexity
  - $"f"_1$: $1 + 2(n(n+1))/2 -> Oh(n^2)$.
  - $"f"_2$: $2 + 4log_2(n) -> Oh(log_2 (n))$.
  - $"f"_3$: $2 + 4log_2(n) -> Oh(log_2 (n))$.
  - $"f"_4$: $2 + 2n log_2(n) + 2 log_2(n) -> Oh(n log_2(n))$.
]

#exr(ovcount: false)[
  +
    #code[
    ```pcode
    input: n > 0
    output: n!

    S := 1
    for i = 2 to n do
      S = S*i
    end
    return S
    ```
    ]
  + The complexity is $1 + 2(n-1) = O(n)$.
]

#exr(ovcount: false)[
  + + $T_1(n) = 9n^2 = O(n^2)$.
    + $T_2(n) = 100n + 96 = O(n)$.
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
  + $T(n) = 3*(n-1)^3 -> Oh(n)$.
]
